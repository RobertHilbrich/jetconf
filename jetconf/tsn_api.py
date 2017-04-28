
from enum import Enum
from typing import List, Union, Dict, Any, Optional

JsonNodeT = Union[Dict[str, Any], List[Any], str, int]

def tsn_connect(transaction_opts: Optional[JsonNodeT]) -> bool:
    print("tsn_conect")

    return True

def tsn_disconnect(transaction_opts: Optional[JsonNodeT], failed: bool=False) -> bool:
    retval = True
    
    return retval

