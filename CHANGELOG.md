# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

### [Unreleased]
- Remove inferred latches in all dynamic_node variants, l2_pipe1_ctrl and uart_mux
- Update storage_addr_trans* to include different board configurations for Ariane

### Release 11

### Added

- Support for Verilator simulation

For Ariane:
- Support for Pitonstream
- Support for RISC-V compliant debug
- Device tree generator
- RISC-V compliant interrupt controllers (PLIC, CLINT)
- Support for SMP Linux
- Support for Ariane builds on the Genesys2, Nexys Video and VC707 FPGA boards

### Changed

For Ariane:
- Updated to Ariane v4.1
- Bugfixes in write-through cache system of Ariane

