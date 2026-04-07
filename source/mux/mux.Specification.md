# mux Specification
This is a human-machine co-created specification for the mux module.

## Filename
mux.sv

## Inputs and Outputs
| Direction | Signal Name |
| --- | --- |
| input | Select |
| input | InputA |
| input | InputB |
| output | OutputC |

### Description
- This selects between InputA and InputB.
- If Select is high then OutputC equals InputA.
- If Select is low then OutputC equals InputB.

