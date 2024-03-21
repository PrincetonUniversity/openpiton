
This simple nonblocking examples uses a USB 2.0 BULK transfer as an example.

Instead of translating the transfer into a series of packets transmitted
back and forth between the host and device, a single transfer is exchanged
and the timing points (i.e. calls to nb_transport_fw/bw()) are used in lieu
packet transfers.

For a normal host->device bulk transfer, the following timing points occur
until a UVM_TLM_COMPLETED sync value is received
by either the host or the device.

1. nb_transport_fw(xfer, ph)
   - xfer.kind == OUT
   - ph == USB_TLM_TOKEN
   > Device responds with UVM_TLM_ACCEPTED, or
   > Device responds with UVM_TLM_COMPLETED

2. nb_transport_fw(xfer, ph)
   - xfer.data contains bulk data
   - ph == USB_TLM_DATA
   > Device responds with UVM_TLM_ACCEPTED, or
   > Device responds with UVM_TLM_COMPLETED, xfer.status == ACK/NAK/STALL/NYET
     and ph updated to UVM_TLM_HANDSHAKE

3. nb_transport_bw(xfer, ph)
   - xfer.status == ACK/NACK/STALL/NYET
   - ph == USB_TLM_HANDSKAHE
   > Host responds with UVM_TLM_COMPLETED

For a device->host bulk transfer, the following timing points occur
until a UVM_TLM_COMPLETED sync value is received
by either the host or the device.

1. nb_transport_fw(xfer, ph)
   - xfer.kind == IN
   - ph == USB_TLM_TOKEN
   > Device responds with UVM_TLM_ACCEPTED, or
   > Device responds with UVM_TLM_UPDATED, xfer.data contains bulk data
     and ph updated to UVM_TLM_DATA (goto step 3), or
   > Device responds with UVM_TLM_COMPLETED, xfer.status == NAK/STALL
     and ph updated to UVM_TLM_HANDSHAKE

2. nb_transport_bw(xfer, ph)
   - xfer.data contains bulk data
   - ph == USB_TLM_DATA
   > Host responds with UVM_TLM_ACCEPTED, or
   > Host responds with UVM_TLM_COMPLETED, xfer.status == ACK
     and ph updated to UVM_TLM_HANDSHAKE

3. nb_transport_fw(xfer, ph)
   - xfer.status == ACK
   - ph == USB_TLM_HANDSKAHE
   > Device responds with UVM_TLM_COMPLETED
