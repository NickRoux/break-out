break-out
=========

Atari clone clone written entirely in ARM assembly. This game is played on Rpi, with minimized kernel.

To play this game Rpi is required, along with a old school SNES controller. You will also need a Jtag unit.

To play:

  1) Connect Jtag to host machine via USB cable
  2) Insert memory card into your Rpi
  3) Connect power cable to your Rpi
  4) Connect HDMI cable to your Rpi
  5) Connect USB to TTL cable to your host machine
  6) In your Linux host machine, open terminal and navigate to the directory of the game
  7) Run '$ JLinkGDBServer' command in your terminal 
  8) Open new terminal window and navigate to the game directory
  9) Run '$ arm-none-eabi-gdb build/output.elf' to start GDB
 10) Connect GDB to the create JLink server by running '$ target remote localhost:<defined localhsot>()usually 2331)'
 11) Build the project by ' make'
 12) Upload new image of the project t othe Rpi ' load'
 13) Set the program at the very start ' set $pc=_start'
 14) 'c' to run the program
 15) make sure your SNES controller is pluged in and enjoy
  
