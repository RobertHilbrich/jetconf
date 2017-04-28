from enum import Enum
from typing import Dict, List
from colorlog import error, warning as warn, info

from .helpers import JsonNodeT


class UserCmd(Enum):
    SET = 0
    UNSET = 1


class UserOp:
    def __init__(self, cmd: UserCmd, op_input: JsonNodeT):
        self.cmd = cmd
        self.op_input = op_input


class OpHandlersContainer:
    def __init__(self):
        self.op_journal = {}     # type: Dict[str, List[UserOp]]

    def zone_begin_transaction(self, input_args: JsonNodeT, username: str) -> JsonNodeT:
        self.op_journal[username] = []

    def zone_commit_transaction(self, input_args: JsonNodeT, username: str) -> JsonNodeT:
        try:
            usr_op_journal = self.op_journal[username]
        except KeyError:
            warn("zone_commit_transaction: Nothing to commit")
            return

        # TODO
        del self.op_journal[username]

    def zone_abort_transaction(self, input_args: JsonNodeT, username: str) -> JsonNodeT:
        try:
            del self.op_journal[username]
        except KeyError:
            warn("zone_abort_transaction: Nothing to abort")

    def zone_set(self, input_args: JsonNodeT, username: str) -> JsonNodeT:
        try:
            usr_op_journal = self.op_journal[username]
        except KeyError:
            warn("zone_set: Op transaction not started")
            return

        usr_op_journal.append(UserOp(UserCmd.SET, input_args))

    def zone_unset(self, input_args: JsonNodeT, username: str) -> JsonNodeT:
        try:
            usr_op_journal = self.op_journal[username]
        except KeyError:
            warn("zone_set: Op transaction not started")
            return

        usr_op_journal.append(UserOp(UserCmd.UNSET, input_args))


OP_HANDLERS_IMPL = OpHandlersContainer()
