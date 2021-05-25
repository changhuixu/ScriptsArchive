# Raspberry Pi

## Run a Program on Raspberry Pi at Startup

### Using the file `rc.local`

In order to have a command or program run when the Pi boots, you can add commands to the `rc.local` file. This is especially useful if you want to power up your Pi in headless mode (that is without a connected monitor), and have it run a program without configuration or a manual start.

On your Pi, edit the file /etc/rc.local using the editor of your choice. You must edit it with root permissions:

```bash
sudo nano /etc/rc.local
```

Add commands to execute the python program, preferably using absolute referencing of the file location (complete file path are preferred). Be sure to leave the line `exit 0` at the end, then save the file and exit. In nano, to exit, type `Ctrl-x`, and then `Y`.

If your program runs continuously (runs an infinite loop) or is likely not to exit, you must be sure to fork the process by adding an ampersand (`&`) to the end of the command, like:

```bash
sudo python /home/pi/sample.py &
```

The Pi will run this program at startup, and before other services are started. If you don't include the ampersand and if your program runs continuously, the Pi will not complete its boot process. The ampersand allows the command to run in a separate process and continue booting with the main process running.

Now reboot the Pi to test it:

```bash
sudo reboot
```

Hints
Also, be sure to reference absolute file names rather than relative to your home folder. For example use `/home/pi/myscript.py` instead of `myscript.py`.

If you add a script into /etc/rc.local, it is added to the boot sequence. If your code gets stuck then the boot sequence cannot proceed. So be careful as to which code you are trying to run at boot and test the code a couple of times. You can also get the script's output and error written to a text file (say log.txt) and use it to debug.

```bash
sudo python /home/pi/sample.py & > /home/pi/Desktop/log.txt 2>&1
```

You don't need sudo.
Everything in /etc/rc.local runs as the root user.

```bash
(sleep 10;python scriptname.py)&
```
