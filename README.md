Tracklet workshop
=================

Goals of the exercise
--------------
This hands-on exercise is meant as a very brief introduction to the firmware that is being developed for the tracklet approach to tracking at Level-1. 

The exercise is intended to provide a small example of the two main components of the firmware: Calculations and Routing. There are two stages in the exercise dedicated to each component and these can be done independent of each other.

### Calculations:
The first part of the exercise will require you to calculate the expected track positions after being projected onto a layer. The inputs to this calculation are the tracklet parameters calculated previously and the radial position of the layer where you are projecting. The steps required in the calculation are outlined in the [whitepaper](https://www.dropbox.com/s/x7kqrjvbju8vjd5/whitepaper.pdf?dl=0) (page 11). Going from a floating point calculation to an integer calculation is not trivial. We have optimized the number of bits required for the needed precision using the C++ emulation compared to the floating point calculation. The idea of the exercise is to process the calculation steps in a pipeline, such that at every clock cycle new data comes in and the current data moves along on to the next step. The data formats are provided below.

### Routing
After calculating the expected position of the tracks onto other layer, we need to organize this information according to **Virtual Modules (VM)**. The Virtual Modules allow us to consider less possible combination for a possible match between the projected track and the stubs in that layer. For now we will only consider the routing of some of the projection information.

The first step requires you to format the projection data into VM data. This reduced version is what will be used for the first rough matching to stubs. The VM format is presented below. After formatting the projection, you will need write it to the appropriate memory. The `wr_en` bits are set depending on the `phi` and `z` expected positions of the tracklet.

### Data Formats

Tracklet format:

Variable | bits |
---------|------|
Signed r_inv | 53:40 |
phi0 | 39:23 |
z0 | 22:13 |
t | 12:0 |

Projection format:

Variable | bits |
---------|------|
filler | 53:45 |
phi position | 44:30 |
z position | 29:18 |
phi der | 17:9 |
z der | 8:0 |

VM Projection format:

Variable | bits |
---------|------|
Index | 12:7 |
phi position | 6:4 |
z position | 3:0 |


Getting the code
-----------------

Clone the Github repository to your local machine or simply download the zip file.
Solutions to the exercise are available in the `Solutions` branch of the repository.

The contents of the project include a `xise` file with the ISE project, the corresponding Verilog modules, and the text files with the input data.

Running the provided code
---------------------------

After you get the code from Github, the first thing to do is to open the `xise` file and run an initial **Behavioral Simulation**. Hopefully an ISIM window will appear with the default Waveform Configuration File. This will be the tool you will use to debug and test our code.

If you have not modified the code, the memories for the two parts would have been loaded. You can easily see the contents of these memories in the **Memory Editor** (`Verilog_top > uut > tracklets > RAM` and `Verilog_top > uut > projections > RAM`).

The code provides you with the structure of how the modules interact with each other and how the signals are routed. You are free to modify it as needed, but ideally all the work would be contained in the `Calculations` and `Routing` modules.