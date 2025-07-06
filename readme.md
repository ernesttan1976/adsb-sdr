
## Step 1: Test RTL-SDR Hardware

First, let's make sure your RTL-SDR 2832 is working properly:

### Install RTL-SDR Drivers
1. Download Zadig from https://zadig.akeo.ie/
2. Plug in your RTL-SDR dongle
3. Run Zadig as Administrator
4. In Zadig:
   - Go to Options → List All Devices
   - Select your RTL-SDR device (usually "Bulk-In, Interface (Interface 0)" or "RTL2838UHIDIR")
   - Change driver to "WinUSB"
   - Click "Replace Driver"

### Test with RTL-SDR Software
1. Download SDR# (SDRSharp) from https://airspy.com/download/
2. Extract to a folder (e.g., `C:\SDRSharp`)
3. Run `install-rtlsdr.bat` as Administrator
4. Launch `SDRSharp.exe`

### Verify Hardware Works
1. In SDR#:
   - Source: Select "RTL-SDR USB"
   - Click the gear icon, set Sample Rate to 2.048 MSPS
   - Set frequency to 1090 MHz (1090000000)
   - Click the Play button
2. You should see the waterfall display updating
3. Try tuning to a local FM radio station (88-108 MHz) to confirm reception

**Stop here and confirm**: Can you see signals in SDR# and tune to FM radio stations? If not, we need to fix the hardware setup first.

Once hardware is confirmed working, let me know and I'll give you the next step to test ADS-B reception.

Step 2: Test ADS-B Reception in SDR#
Configure SDR# for ADS-B:

Set frequency to 1090 MHz:

In the frequency box, enter: 1090000000
Or use the frequency slider


Adjust settings for ADS-B:

Sample Rate: 2.048 MSPS (should already be set)
RF Gain: Try around 40-50 dB (adjust if needed)
Zoom: Zoom in on the waterfall to see narrow signals
Filter Width: Set to around 10 kHz


What to look for:

ADS-B signals appear as brief vertical lines on the waterfall
They're very short bursts (microseconds)
You should see occasional spikes at 1090 MHz if aircraft are nearby



Install ADS-B Decoder Plugin for SDR#:

Download the ADS-B plugin from: https://github.com/theori-io/SDRSharp.ADSB
Extract the files to your SDRSharp folder
Add this line to Plugins.xml:

xml<add key="ADS-B" value="SDRSharp.ADSB.ADSBPlugin,SDRSharp.ADSB" />

Restart SDR#
You should now see an "ADS-B" panel

Quick test: Leave SDR# running on 1090 MHz for 5-10 minutes. Do you see any brief signal spikes on the waterfall display?
If you see signals, we'll move to the Python script. If not, we might need to adjust antenna or location.
What do you see on the waterfall at 1090 MHz?