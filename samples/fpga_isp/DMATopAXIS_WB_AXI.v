module WishboneCSRAXIS_WB_AXI( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_ctl_dat_i, // @[:@6.4]
  output [31:0] io_ctl_dat_o, // @[:@6.4]
  input         io_ctl_cyc_i, // @[:@6.4]
  input         io_ctl_stb_i, // @[:@6.4]
  input         io_ctl_we_i, // @[:@6.4]
  input  [29:0] io_ctl_adr_i, // @[:@6.4]
  output        io_ctl_ack_o, // @[:@6.4]
  output [3:0]  io_bus_addr, // @[:@6.4]
  output [31:0] io_bus_dataOut, // @[:@6.4]
  input  [31:0] io_bus_dataIn, // @[:@6.4]
  output        io_bus_write, // @[:@6.4]
  output        io_bus_read // @[:@6.4]
);
  reg  state; // @[WishboneCSR.scala 32:22:@8.4]
  reg [31:0] _RAND_0;
  reg  ack; // @[WishboneCSR.scala 34:21:@9.4]
  reg [31:0] _RAND_1;
  wire  valid; // @[WishboneCSR.scala 36:37:@10.4]
  wire  _T_40; // @[Conditional.scala 37:30:@13.4]
  wire  _GEN_0; // @[WishboneCSR.scala 41:40:@17.6]
  wire  _GEN_2; // @[Conditional.scala 39:67:@24.6]
  wire  _GEN_3; // @[Conditional.scala 39:67:@24.6]
  wire  _GEN_4; // @[Conditional.scala 40:58:@14.4]
  wire  _GEN_5; // @[Conditional.scala 40:58:@14.4]
  wire  _T_50; // @[WishboneCSR.scala 57:24:@33.4]
  assign valid = io_ctl_stb_i & io_ctl_cyc_i; // @[WishboneCSR.scala 36:37:@10.4]
  assign _T_40 = 1'h0 == state; // @[Conditional.scala 37:30:@13.4]
  assign _GEN_0 = valid ? 1'h1 : state; // @[WishboneCSR.scala 41:40:@17.6]
  assign _GEN_2 = state ? 1'h0 : ack; // @[Conditional.scala 39:67:@24.6]
  assign _GEN_3 = state ? 1'h0 : state; // @[Conditional.scala 39:67:@24.6]
  assign _GEN_4 = _T_40 ? valid : _GEN_2; // @[Conditional.scala 40:58:@14.4]
  assign _GEN_5 = _T_40 ? _GEN_0 : _GEN_3; // @[Conditional.scala 40:58:@14.4]
  assign _T_50 = io_ctl_we_i == 1'h0; // @[WishboneCSR.scala 57:24:@33.4]
  assign io_ctl_dat_o = io_bus_dataIn; // @[WishboneCSR.scala 60:16:@37.4]
  assign io_ctl_ack_o = ack; // @[WishboneCSR.scala 55:16:@30.4]
  assign io_bus_addr = io_ctl_adr_i[3:0]; // @[WishboneCSR.scala 61:15:@38.4]
  assign io_bus_dataOut = io_ctl_dat_i; // @[WishboneCSR.scala 59:18:@36.4]
  assign io_bus_write = ack & io_ctl_we_i; // @[WishboneCSR.scala 56:16:@32.4]
  assign io_bus_read = ack & _T_50; // @[WishboneCSR.scala 57:15:@35.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ack = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 1'h0;
    end else begin
      if (_T_40) begin
        if (valid) begin
          state <= 1'h1;
        end
      end else begin
        if (state) begin
          state <= 1'h0;
        end
      end
    end
    if (reset) begin
      ack <= 1'h0;
    end else begin
      if (_T_40) begin
        ack <= valid;
      end else begin
        if (state) begin
          ack <= 1'h0;
        end
      end
    end
  end
endmodule
module AXIStreamSlaveAXIS_WB_AXI( // @[:@40.2]
  input         clock, // @[:@41.4]
  input         reset, // @[:@42.4]
  input  [31:0] io_bus_tdata, // @[:@43.4]
  input         io_bus_tvalid, // @[:@43.4]
  output        io_bus_tready, // @[:@43.4]
  input         io_dataIO_ready, // @[:@43.4]
  output        io_dataIO_valid, // @[:@43.4]
  output [31:0] io_dataIO_bits, // @[:@43.4]
  output        io_xfer_done, // @[:@43.4]
  input  [31:0] io_xfer_length, // @[:@43.4]
  input         io_xfer_valid // @[:@43.4]
);
  reg [1:0] state; // @[AXIStreamSlave.scala 34:22:@45.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXIStreamSlave.scala 36:21:@46.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXIStreamSlave.scala 38:23:@47.4]
  reg [31:0] _RAND_2;
  reg [31:0] length; // @[AXIStreamSlave.scala 40:23:@48.4]
  reg [31:0] _RAND_3;
  wire  ready; // @[AXIStreamSlave.scala 42:40:@49.4]
  wire  valid; // @[AXIStreamSlave.scala 43:38:@52.4]
  wire  _T_66; // @[Conditional.scala 37:30:@59.4]
  wire [1:0] _GEN_0; // @[AXIStreamSlave.scala 57:26:@63.6]
  wire [31:0] _GEN_1; // @[AXIStreamSlave.scala 57:26:@63.6]
  wire  _T_70; // @[Conditional.scala 37:30:@70.6]
  wire  _T_71; // @[AXIStreamSlave.scala 64:18:@72.8]
  wire [32:0] _T_73; // @[AXIStreamSlave.scala 65:26:@74.10]
  wire [32:0] _T_74; // @[AXIStreamSlave.scala 65:26:@75.10]
  wire [31:0] _T_75; // @[AXIStreamSlave.scala 65:26:@76.10]
  wire  _T_77; // @[AXIStreamSlave.scala 66:21:@78.10]
  wire [1:0] _GEN_3; // @[AXIStreamSlave.scala 66:29:@79.10]
  wire  _GEN_4; // @[AXIStreamSlave.scala 66:29:@79.10]
  wire [31:0] _GEN_5; // @[AXIStreamSlave.scala 64:27:@73.8]
  wire [1:0] _GEN_6; // @[AXIStreamSlave.scala 64:27:@73.8]
  wire  _GEN_7; // @[AXIStreamSlave.scala 64:27:@73.8]
  wire  _T_79; // @[Conditional.scala 37:30:@86.8]
  wire [1:0] _GEN_8; // @[Conditional.scala 39:67:@87.8]
  wire  _GEN_9; // @[Conditional.scala 39:67:@87.8]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@71.6]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@71.6]
  wire  _GEN_12; // @[Conditional.scala 39:67:@71.6]
  wire  _GEN_13; // @[Conditional.scala 39:67:@71.6]
  wire  _GEN_14; // @[Conditional.scala 40:58:@60.4]
  wire  _GEN_15; // @[Conditional.scala 40:58:@60.4]
  wire [1:0] _GEN_16; // @[Conditional.scala 40:58:@60.4]
  wire [31:0] _GEN_17; // @[Conditional.scala 40:58:@60.4]
  assign ready = io_dataIO_ready & enable; // @[AXIStreamSlave.scala 42:40:@49.4]
  assign valid = io_bus_tvalid & enable; // @[AXIStreamSlave.scala 43:38:@52.4]
  assign _T_66 = 2'h0 == state; // @[Conditional.scala 37:30:@59.4]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXIStreamSlave.scala 57:26:@63.6]
  assign _GEN_1 = io_xfer_valid ? io_xfer_length : length; // @[AXIStreamSlave.scala 57:26:@63.6]
  assign _T_70 = 2'h1 == state; // @[Conditional.scala 37:30:@70.6]
  assign _T_71 = ready & valid; // @[AXIStreamSlave.scala 64:18:@72.8]
  assign _T_73 = length - 32'h1; // @[AXIStreamSlave.scala 65:26:@74.10]
  assign _T_74 = $unsigned(_T_73); // @[AXIStreamSlave.scala 65:26:@75.10]
  assign _T_75 = _T_74[31:0]; // @[AXIStreamSlave.scala 65:26:@76.10]
  assign _T_77 = length == 32'h1; // @[AXIStreamSlave.scala 66:21:@78.10]
  assign _GEN_3 = _T_77 ? 2'h2 : state; // @[AXIStreamSlave.scala 66:29:@79.10]
  assign _GEN_4 = _T_77 ? 1'h0 : enable; // @[AXIStreamSlave.scala 66:29:@79.10]
  assign _GEN_5 = _T_71 ? _T_75 : length; // @[AXIStreamSlave.scala 64:27:@73.8]
  assign _GEN_6 = _T_71 ? _GEN_3 : state; // @[AXIStreamSlave.scala 64:27:@73.8]
  assign _GEN_7 = _T_71 ? _GEN_4 : enable; // @[AXIStreamSlave.scala 64:27:@73.8]
  assign _T_79 = 2'h2 == state; // @[Conditional.scala 37:30:@86.8]
  assign _GEN_8 = _T_79 ? 2'h0 : state; // @[Conditional.scala 39:67:@87.8]
  assign _GEN_9 = _T_79 ? 1'h1 : done; // @[Conditional.scala 39:67:@87.8]
  assign _GEN_10 = _T_70 ? _GEN_5 : length; // @[Conditional.scala 39:67:@71.6]
  assign _GEN_11 = _T_70 ? _GEN_6 : _GEN_8; // @[Conditional.scala 39:67:@71.6]
  assign _GEN_12 = _T_70 ? _GEN_7 : enable; // @[Conditional.scala 39:67:@71.6]
  assign _GEN_13 = _T_70 ? done : _GEN_9; // @[Conditional.scala 39:67:@71.6]
  assign _GEN_14 = _T_66 ? 1'h0 : _GEN_13; // @[Conditional.scala 40:58:@60.4]
  assign _GEN_15 = _T_66 ? io_xfer_valid : _GEN_12; // @[Conditional.scala 40:58:@60.4]
  assign _GEN_16 = _T_66 ? _GEN_0 : _GEN_11; // @[Conditional.scala 40:58:@60.4]
  assign _GEN_17 = _T_66 ? _GEN_1 : _GEN_10; // @[Conditional.scala 40:58:@60.4]
  assign io_bus_tready = io_dataIO_ready & enable; // @[AXIStreamSlave.scala 46:17:@56.4]
  assign io_dataIO_valid = io_bus_tvalid & enable; // @[AXIStreamSlave.scala 45:19:@55.4]
  assign io_dataIO_bits = io_bus_tdata; // @[AXIStreamSlave.scala 48:18:@57.4]
  assign io_xfer_done = done; // @[AXIStreamSlave.scala 50:16:@58.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  done = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  length = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_66) begin
        if (io_xfer_valid) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_70) begin
          if (_T_71) begin
            if (_T_77) begin
              state <= 2'h2;
            end
          end
        end else begin
          if (_T_79) begin
            state <= 2'h0;
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_66) begin
        done <= 1'h0;
      end else begin
        if (!(_T_70)) begin
          if (_T_79) begin
            done <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (_T_66) begin
        enable <= io_xfer_valid;
      end else begin
        if (_T_70) begin
          if (_T_71) begin
            if (_T_77) begin
              enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      length <= 32'h0;
    end else begin
      if (_T_66) begin
        if (io_xfer_valid) begin
          length <= io_xfer_length;
        end
      end else begin
        if (_T_70) begin
          if (_T_71) begin
            length <= _T_75;
          end
        end
      end
    end
  end
endmodule
module AXI4WriterAXIS_WB_AXI( // @[:@92.2]
  input         clock, // @[:@93.4]
  input         reset, // @[:@94.4]
  output [31:0] io_bus_aw_awaddr, // @[:@95.4]
  output [7:0]  io_bus_aw_awlen, // @[:@95.4]
  output        io_bus_aw_awvalid, // @[:@95.4]
  input         io_bus_aw_awready, // @[:@95.4]
  output [31:0] io_bus_w_wdata, // @[:@95.4]
  output        io_bus_w_wlast, // @[:@95.4]
  output        io_bus_w_wvalid, // @[:@95.4]
  input         io_bus_w_wready, // @[:@95.4]
  input         io_bus_b_bvalid, // @[:@95.4]
  output        io_bus_b_bready, // @[:@95.4]
  output        io_dataIO_ready, // @[:@95.4]
  input         io_dataIO_valid, // @[:@95.4]
  input  [31:0] io_dataIO_bits, // @[:@95.4]
  output        io_xfer_done, // @[:@95.4]
  input  [31:0] io_xfer_address, // @[:@95.4]
  input  [31:0] io_xfer_length, // @[:@95.4]
  input         io_xfer_valid // @[:@95.4]
);
  reg [1:0] dataState; // @[AXI4Writer.scala 35:26:@97.4]
  reg [31:0] _RAND_0;
  reg [1:0] addrState; // @[AXI4Writer.scala 36:26:@98.4]
  reg [31:0] _RAND_1;
  reg  done; // @[AXI4Writer.scala 38:21:@99.4]
  reg [31:0] _RAND_2;
  reg  enable; // @[AXI4Writer.scala 39:23:@100.4]
  reg [31:0] _RAND_3;
  reg [31:0] length; // @[AXI4Writer.scala 41:23:@103.4]
  reg [31:0] _RAND_4;
  reg [31:0] awlen; // @[AXI4Writer.scala 42:22:@104.4]
  reg [31:0] _RAND_5;
  reg [31:0] awaddr; // @[AXI4Writer.scala 43:23:@105.4]
  reg [31:0] _RAND_6;
  reg  awvalid; // @[AXI4Writer.scala 48:24:@111.4]
  reg [31:0] _RAND_7;
  reg  bready; // @[AXI4Writer.scala 49:23:@112.4]
  reg [31:0] _RAND_8;
  wire  ready; // @[AXI4Writer.scala 51:40:@113.4]
  wire  valid; // @[AXI4Writer.scala 52:40:@116.4]
  wire  _T_243; // @[Conditional.scala 37:30:@191.4]
  wire [31:0] _GEN_0; // @[AXI4Writer.scala 69:26:@194.6]
  wire [1:0] _GEN_1; // @[AXI4Writer.scala 69:26:@194.6]
  wire  _GEN_2; // @[AXI4Writer.scala 69:26:@194.6]
  wire  _T_246; // @[Conditional.scala 37:30:@201.6]
  wire  _T_247; // @[AXI4Writer.scala 76:18:@203.8]
  wire  _T_249; // @[AXI4Writer.scala 77:21:@205.10]
  wire [32:0] _T_251; // @[AXI4Writer.scala 78:28:@207.12]
  wire [32:0] _T_252; // @[AXI4Writer.scala 78:28:@208.12]
  wire [31:0] _T_253; // @[AXI4Writer.scala 78:28:@209.12]
  wire [31:0] _GEN_3; // @[AXI4Writer.scala 77:27:@206.10]
  wire [1:0] _GEN_4; // @[AXI4Writer.scala 77:27:@206.10]
  wire  _GEN_5; // @[AXI4Writer.scala 77:27:@206.10]
  wire  _GEN_6; // @[AXI4Writer.scala 77:27:@206.10]
  wire [31:0] _GEN_7; // @[AXI4Writer.scala 76:27:@204.8]
  wire [1:0] _GEN_8; // @[AXI4Writer.scala 76:27:@204.8]
  wire  _GEN_9; // @[AXI4Writer.scala 76:27:@204.8]
  wire  _GEN_10; // @[AXI4Writer.scala 76:27:@204.8]
  wire  _T_256; // @[Conditional.scala 37:30:@220.8]
  wire  _T_257; // @[AXI4Writer.scala 87:19:@222.10]
  wire  _GEN_11; // @[AXI4Writer.scala 87:38:@223.10]
  wire [1:0] _GEN_12; // @[AXI4Writer.scala 87:38:@223.10]
  wire  _T_259; // @[Conditional.scala 37:30:@229.10]
  wire  _GEN_13; // @[Conditional.scala 39:67:@230.10]
  wire [1:0] _GEN_14; // @[Conditional.scala 39:67:@230.10]
  wire  _GEN_15; // @[Conditional.scala 39:67:@221.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@221.8]
  wire  _GEN_17; // @[Conditional.scala 39:67:@221.8]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@202.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 39:67:@202.6]
  wire  _GEN_20; // @[Conditional.scala 39:67:@202.6]
  wire  _GEN_21; // @[Conditional.scala 39:67:@202.6]
  wire  _GEN_22; // @[Conditional.scala 39:67:@202.6]
  wire  _GEN_23; // @[Conditional.scala 40:58:@192.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@192.4]
  wire [1:0] _GEN_25; // @[Conditional.scala 40:58:@192.4]
  wire  _GEN_26; // @[Conditional.scala 40:58:@192.4]
  wire  _GEN_27; // @[Conditional.scala 40:58:@192.4]
  wire  _T_261; // @[Conditional.scala 37:30:@234.4]
  wire [32:0] _T_263; // @[AXI4Writer.scala 102:33:@238.8]
  wire [32:0] _T_264; // @[AXI4Writer.scala 102:33:@239.8]
  wire [31:0] _T_265; // @[AXI4Writer.scala 102:33:@240.8]
  wire [31:0] _GEN_28; // @[AXI4Writer.scala 100:26:@236.6]
  wire [31:0] _GEN_29; // @[AXI4Writer.scala 100:26:@236.6]
  wire  _GEN_30; // @[AXI4Writer.scala 100:26:@236.6]
  wire [1:0] _GEN_31; // @[AXI4Writer.scala 100:26:@236.6]
  wire  _T_267; // @[Conditional.scala 37:30:@247.6]
  wire  _T_268; // @[AXI4Writer.scala 108:20:@249.8]
  wire [1:0] _GEN_32; // @[AXI4Writer.scala 108:41:@250.8]
  wire  _GEN_33; // @[AXI4Writer.scala 108:41:@250.8]
  wire  _T_270; // @[Conditional.scala 37:30:@256.8]
  wire [1:0] _GEN_34; // @[AXI4Writer.scala 114:17:@258.10]
  wire [1:0] _GEN_35; // @[Conditional.scala 39:67:@257.8]
  wire [1:0] _GEN_36; // @[Conditional.scala 39:67:@248.6]
  wire  _GEN_37; // @[Conditional.scala 39:67:@248.6]
  wire [31:0] _GEN_38; // @[Conditional.scala 40:58:@235.4]
  wire [31:0] _GEN_39; // @[Conditional.scala 40:58:@235.4]
  wire  _GEN_40; // @[Conditional.scala 40:58:@235.4]
  wire [1:0] _GEN_41; // @[Conditional.scala 40:58:@235.4]
  assign ready = io_bus_w_wready & enable; // @[AXI4Writer.scala 51:40:@113.4]
  assign valid = io_dataIO_valid & enable; // @[AXI4Writer.scala 52:40:@116.4]
  assign _T_243 = 2'h0 == dataState; // @[Conditional.scala 37:30:@191.4]
  assign _GEN_0 = io_xfer_valid ? io_xfer_length : length; // @[AXI4Writer.scala 69:26:@194.6]
  assign _GEN_1 = io_xfer_valid ? 2'h1 : dataState; // @[AXI4Writer.scala 69:26:@194.6]
  assign _GEN_2 = io_xfer_valid ? 1'h1 : enable; // @[AXI4Writer.scala 69:26:@194.6]
  assign _T_246 = 2'h1 == dataState; // @[Conditional.scala 37:30:@201.6]
  assign _T_247 = ready & valid; // @[AXI4Writer.scala 76:18:@203.8]
  assign _T_249 = length > 32'h1; // @[AXI4Writer.scala 77:21:@205.10]
  assign _T_251 = length - 32'h1; // @[AXI4Writer.scala 78:28:@207.12]
  assign _T_252 = $unsigned(_T_251); // @[AXI4Writer.scala 78:28:@208.12]
  assign _T_253 = _T_252[31:0]; // @[AXI4Writer.scala 78:28:@209.12]
  assign _GEN_3 = _T_249 ? _T_253 : length; // @[AXI4Writer.scala 77:27:@206.10]
  assign _GEN_4 = _T_249 ? dataState : 2'h2; // @[AXI4Writer.scala 77:27:@206.10]
  assign _GEN_5 = _T_249 ? enable : 1'h0; // @[AXI4Writer.scala 77:27:@206.10]
  assign _GEN_6 = _T_249 ? bready : 1'h1; // @[AXI4Writer.scala 77:27:@206.10]
  assign _GEN_7 = _T_247 ? _GEN_3 : length; // @[AXI4Writer.scala 76:27:@204.8]
  assign _GEN_8 = _T_247 ? _GEN_4 : dataState; // @[AXI4Writer.scala 76:27:@204.8]
  assign _GEN_9 = _T_247 ? _GEN_5 : enable; // @[AXI4Writer.scala 76:27:@204.8]
  assign _GEN_10 = _T_247 ? _GEN_6 : bready; // @[AXI4Writer.scala 76:27:@204.8]
  assign _T_256 = 2'h2 == dataState; // @[Conditional.scala 37:30:@220.8]
  assign _T_257 = bready & io_bus_b_bvalid; // @[AXI4Writer.scala 87:19:@222.10]
  assign _GEN_11 = _T_257 ? 1'h0 : bready; // @[AXI4Writer.scala 87:38:@223.10]
  assign _GEN_12 = _T_257 ? 2'h3 : dataState; // @[AXI4Writer.scala 87:38:@223.10]
  assign _T_259 = 2'h3 == dataState; // @[Conditional.scala 37:30:@229.10]
  assign _GEN_13 = _T_259 ? 1'h1 : done; // @[Conditional.scala 39:67:@230.10]
  assign _GEN_14 = _T_259 ? 2'h0 : dataState; // @[Conditional.scala 39:67:@230.10]
  assign _GEN_15 = _T_256 ? _GEN_11 : bready; // @[Conditional.scala 39:67:@221.8]
  assign _GEN_16 = _T_256 ? _GEN_12 : _GEN_14; // @[Conditional.scala 39:67:@221.8]
  assign _GEN_17 = _T_256 ? done : _GEN_13; // @[Conditional.scala 39:67:@221.8]
  assign _GEN_18 = _T_246 ? _GEN_7 : length; // @[Conditional.scala 39:67:@202.6]
  assign _GEN_19 = _T_246 ? _GEN_8 : _GEN_16; // @[Conditional.scala 39:67:@202.6]
  assign _GEN_20 = _T_246 ? _GEN_9 : enable; // @[Conditional.scala 39:67:@202.6]
  assign _GEN_21 = _T_246 ? _GEN_10 : _GEN_15; // @[Conditional.scala 39:67:@202.6]
  assign _GEN_22 = _T_246 ? done : _GEN_17; // @[Conditional.scala 39:67:@202.6]
  assign _GEN_23 = _T_243 ? 1'h0 : _GEN_22; // @[Conditional.scala 40:58:@192.4]
  assign _GEN_24 = _T_243 ? _GEN_0 : _GEN_18; // @[Conditional.scala 40:58:@192.4]
  assign _GEN_25 = _T_243 ? _GEN_1 : _GEN_19; // @[Conditional.scala 40:58:@192.4]
  assign _GEN_26 = _T_243 ? _GEN_2 : _GEN_20; // @[Conditional.scala 40:58:@192.4]
  assign _GEN_27 = _T_243 ? bready : _GEN_21; // @[Conditional.scala 40:58:@192.4]
  assign _T_261 = 2'h0 == addrState; // @[Conditional.scala 37:30:@234.4]
  assign _T_263 = io_xfer_length - 32'h1; // @[AXI4Writer.scala 102:33:@238.8]
  assign _T_264 = $unsigned(_T_263); // @[AXI4Writer.scala 102:33:@239.8]
  assign _T_265 = _T_264[31:0]; // @[AXI4Writer.scala 102:33:@240.8]
  assign _GEN_28 = io_xfer_valid ? io_xfer_address : awaddr; // @[AXI4Writer.scala 100:26:@236.6]
  assign _GEN_29 = io_xfer_valid ? _T_265 : awlen; // @[AXI4Writer.scala 100:26:@236.6]
  assign _GEN_30 = io_xfer_valid ? 1'h1 : awvalid; // @[AXI4Writer.scala 100:26:@236.6]
  assign _GEN_31 = io_xfer_valid ? 2'h1 : addrState; // @[AXI4Writer.scala 100:26:@236.6]
  assign _T_267 = 2'h1 == addrState; // @[Conditional.scala 37:30:@247.6]
  assign _T_268 = awvalid & io_bus_aw_awready; // @[AXI4Writer.scala 108:20:@249.8]
  assign _GEN_32 = _T_268 ? 2'h2 : addrState; // @[AXI4Writer.scala 108:41:@250.8]
  assign _GEN_33 = _T_268 ? 1'h0 : awvalid; // @[AXI4Writer.scala 108:41:@250.8]
  assign _T_270 = 2'h2 == addrState; // @[Conditional.scala 37:30:@256.8]
  assign _GEN_34 = done ? 2'h0 : addrState; // @[AXI4Writer.scala 114:17:@258.10]
  assign _GEN_35 = _T_270 ? _GEN_34 : addrState; // @[Conditional.scala 39:67:@257.8]
  assign _GEN_36 = _T_267 ? _GEN_32 : _GEN_35; // @[Conditional.scala 39:67:@248.6]
  assign _GEN_37 = _T_267 ? _GEN_33 : awvalid; // @[Conditional.scala 39:67:@248.6]
  assign _GEN_38 = _T_261 ? _GEN_28 : awaddr; // @[Conditional.scala 40:58:@235.4]
  assign _GEN_39 = _T_261 ? _GEN_29 : awlen; // @[Conditional.scala 40:58:@235.4]
  assign _GEN_40 = _T_261 ? _GEN_30 : _GEN_37; // @[Conditional.scala 40:58:@235.4]
  assign _GEN_41 = _T_261 ? _GEN_31 : _GEN_36; // @[Conditional.scala 40:58:@235.4]
  assign io_bus_aw_awaddr = awaddr; // @[AXI4Writer.scala 54:13:@139.4]
  assign io_bus_aw_awlen = awlen[7:0]; // @[AXI4Writer.scala 54:13:@138.4]
  assign io_bus_aw_awvalid = awvalid; // @[AXI4Writer.scala 54:13:@131.4]
  assign io_bus_w_wdata = io_dataIO_bits; // @[AXI4Writer.scala 55:12:@150.4]
  assign io_bus_w_wlast = length == 32'h1; // @[AXI4Writer.scala 55:12:@148.4]
  assign io_bus_w_wvalid = io_dataIO_valid & enable; // @[AXI4Writer.scala 55:12:@147.4]
  assign io_bus_b_bready = bready; // @[AXI4Writer.scala 56:12:@153.4]
  assign io_dataIO_ready = io_bus_w_wready & enable; // @[AXI4Writer.scala 60:19:@187.4]
  assign io_xfer_done = done; // @[AXI4Writer.scala 62:16:@188.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dataState = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addrState = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  done = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enable = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  length = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  awlen = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  awaddr = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  awvalid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  bready = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dataState <= 2'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          dataState <= 2'h1;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              dataState <= 2'h2;
            end
          end
        end else begin
          if (_T_256) begin
            if (_T_257) begin
              dataState <= 2'h3;
            end
          end else begin
            if (_T_259) begin
              dataState <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addrState <= 2'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          addrState <= 2'h1;
        end
      end else begin
        if (_T_267) begin
          if (_T_268) begin
            addrState <= 2'h2;
          end
        end else begin
          if (_T_270) begin
            if (done) begin
              addrState <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_243) begin
        done <= 1'h0;
      end else begin
        if (!(_T_246)) begin
          if (!(_T_256)) begin
            if (_T_259) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          enable <= 1'h1;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      length <= 32'h0;
    end else begin
      if (_T_243) begin
        if (io_xfer_valid) begin
          length <= io_xfer_length;
        end
      end else begin
        if (_T_246) begin
          if (_T_247) begin
            if (_T_249) begin
              length <= _T_253;
            end
          end
        end
      end
    end
    if (reset) begin
      awlen <= 32'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awlen <= _T_265;
        end
      end
    end
    if (reset) begin
      awaddr <= 32'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awaddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      awvalid <= 1'h0;
    end else begin
      if (_T_261) begin
        if (io_xfer_valid) begin
          awvalid <= 1'h1;
        end
      end else begin
        if (_T_267) begin
          if (_T_268) begin
            awvalid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      bready <= 1'h0;
    end else begin
      if (!(_T_243)) begin
        if (_T_246) begin
          if (_T_247) begin
            if (!(_T_249)) begin
              bready <= 1'h1;
            end
          end
        end else begin
          if (_T_256) begin
            if (_T_257) begin
              bready <= 1'h0;
            end
          end
        end
      end
    end
  end
endmodule
module CSRAXIS_WB_AXI( // @[:@263.2]
  output [31:0] io_csr_0_dataOut, // @[:@266.4]
  output        io_csr_0_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_0_dataIn, // @[:@266.4]
  input  [31:0] io_csr_1_dataIn, // @[:@266.4]
  output [31:0] io_csr_2_dataOut, // @[:@266.4]
  output        io_csr_2_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_2_dataIn, // @[:@266.4]
  output [31:0] io_csr_3_dataOut, // @[:@266.4]
  output        io_csr_3_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_3_dataIn, // @[:@266.4]
  output [31:0] io_csr_4_dataOut, // @[:@266.4]
  output        io_csr_4_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_4_dataIn, // @[:@266.4]
  output [31:0] io_csr_5_dataOut, // @[:@266.4]
  output        io_csr_5_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_5_dataIn, // @[:@266.4]
  output [31:0] io_csr_6_dataOut, // @[:@266.4]
  output        io_csr_6_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_6_dataIn, // @[:@266.4]
  output [31:0] io_csr_7_dataOut, // @[:@266.4]
  output        io_csr_7_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_7_dataIn, // @[:@266.4]
  output [31:0] io_csr_8_dataOut, // @[:@266.4]
  output        io_csr_8_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_8_dataIn, // @[:@266.4]
  output [31:0] io_csr_9_dataOut, // @[:@266.4]
  output        io_csr_9_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_9_dataIn, // @[:@266.4]
  output [31:0] io_csr_10_dataOut, // @[:@266.4]
  output        io_csr_10_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_10_dataIn, // @[:@266.4]
  output [31:0] io_csr_11_dataOut, // @[:@266.4]
  output        io_csr_11_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_11_dataIn, // @[:@266.4]
  input  [31:0] io_csr_12_dataIn, // @[:@266.4]
  input  [31:0] io_csr_13_dataIn, // @[:@266.4]
  output [31:0] io_csr_14_dataOut, // @[:@266.4]
  output        io_csr_14_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_14_dataIn, // @[:@266.4]
  output [31:0] io_csr_15_dataOut, // @[:@266.4]
  output        io_csr_15_dataWrite, // @[:@266.4]
  input  [31:0] io_csr_15_dataIn, // @[:@266.4]
  input  [3:0]  io_bus_addr, // @[:@266.4]
  input  [31:0] io_bus_dataOut, // @[:@266.4]
  output [31:0] io_bus_dataIn, // @[:@266.4]
  input         io_bus_write, // @[:@266.4]
  input         io_bus_read // @[:@266.4]
);
  wire  _T_178; // @[CSR.scala 32:22:@271.4]
  wire  _T_179; // @[CSR.scala 32:30:@272.4]
  wire [31:0] _GEN_0; // @[CSR.scala 32:45:@273.4]
  wire  _T_184; // @[CSR.scala 39:30:@281.4]
  wire  _T_189; // @[CSR.scala 32:22:@290.4]
  wire  _T_190; // @[CSR.scala 32:30:@291.4]
  wire [31:0] _GEN_4; // @[CSR.scala 32:45:@292.4]
  wire  _T_200; // @[CSR.scala 32:22:@309.4]
  wire  _T_201; // @[CSR.scala 32:30:@310.4]
  wire [31:0] _GEN_8; // @[CSR.scala 32:45:@311.4]
  wire  _T_206; // @[CSR.scala 39:30:@319.4]
  wire  _T_211; // @[CSR.scala 32:22:@328.4]
  wire  _T_212; // @[CSR.scala 32:30:@329.4]
  wire [31:0] _GEN_12; // @[CSR.scala 32:45:@330.4]
  wire  _T_217; // @[CSR.scala 39:30:@338.4]
  wire  _T_222; // @[CSR.scala 32:22:@347.4]
  wire  _T_223; // @[CSR.scala 32:30:@348.4]
  wire [31:0] _GEN_16; // @[CSR.scala 32:45:@349.4]
  wire  _T_228; // @[CSR.scala 39:30:@357.4]
  wire  _T_233; // @[CSR.scala 32:22:@366.4]
  wire  _T_234; // @[CSR.scala 32:30:@367.4]
  wire [31:0] _GEN_20; // @[CSR.scala 32:45:@368.4]
  wire  _T_239; // @[CSR.scala 39:30:@376.4]
  wire  _T_244; // @[CSR.scala 32:22:@385.4]
  wire  _T_245; // @[CSR.scala 32:30:@386.4]
  wire [31:0] _GEN_24; // @[CSR.scala 32:45:@387.4]
  wire  _T_250; // @[CSR.scala 39:30:@395.4]
  wire  _T_255; // @[CSR.scala 32:22:@404.4]
  wire  _T_256; // @[CSR.scala 32:30:@405.4]
  wire [31:0] _GEN_28; // @[CSR.scala 32:45:@406.4]
  wire  _T_261; // @[CSR.scala 39:30:@414.4]
  wire  _T_266; // @[CSR.scala 32:22:@423.4]
  wire  _T_267; // @[CSR.scala 32:30:@424.4]
  wire [31:0] _GEN_32; // @[CSR.scala 32:45:@425.4]
  wire  _T_272; // @[CSR.scala 39:30:@433.4]
  wire  _T_277; // @[CSR.scala 32:22:@442.4]
  wire  _T_278; // @[CSR.scala 32:30:@443.4]
  wire [31:0] _GEN_36; // @[CSR.scala 32:45:@444.4]
  wire  _T_283; // @[CSR.scala 39:30:@452.4]
  wire  _T_288; // @[CSR.scala 32:22:@461.4]
  wire  _T_289; // @[CSR.scala 32:30:@462.4]
  wire [31:0] _GEN_40; // @[CSR.scala 32:45:@463.4]
  wire  _T_294; // @[CSR.scala 39:30:@471.4]
  wire  _T_299; // @[CSR.scala 32:22:@480.4]
  wire  _T_300; // @[CSR.scala 32:30:@481.4]
  wire [31:0] _GEN_44; // @[CSR.scala 32:45:@482.4]
  wire  _T_305; // @[CSR.scala 39:30:@490.4]
  wire  _T_310; // @[CSR.scala 32:22:@499.4]
  wire  _T_311; // @[CSR.scala 32:30:@500.4]
  wire [31:0] _GEN_48; // @[CSR.scala 32:45:@501.4]
  wire  _T_321; // @[CSR.scala 32:22:@518.4]
  wire  _T_322; // @[CSR.scala 32:30:@519.4]
  wire [31:0] _GEN_52; // @[CSR.scala 32:45:@520.4]
  wire  _T_332; // @[CSR.scala 32:22:@537.4]
  wire  _T_333; // @[CSR.scala 32:30:@538.4]
  wire [31:0] _GEN_56; // @[CSR.scala 32:45:@539.4]
  wire  _T_338; // @[CSR.scala 39:30:@547.4]
  wire  _T_343; // @[CSR.scala 32:22:@556.4]
  wire  _T_344; // @[CSR.scala 32:30:@557.4]
  wire  _T_349; // @[CSR.scala 39:30:@566.4]
  assign _T_178 = io_bus_addr == 4'h0; // @[CSR.scala 32:22:@271.4]
  assign _T_179 = _T_178 & io_bus_read; // @[CSR.scala 32:30:@272.4]
  assign _GEN_0 = _T_179 ? io_csr_0_dataIn : 32'h0; // @[CSR.scala 32:45:@273.4]
  assign _T_184 = _T_178 & io_bus_write; // @[CSR.scala 39:30:@281.4]
  assign _T_189 = io_bus_addr == 4'h1; // @[CSR.scala 32:22:@290.4]
  assign _T_190 = _T_189 & io_bus_read; // @[CSR.scala 32:30:@291.4]
  assign _GEN_4 = _T_190 ? io_csr_1_dataIn : _GEN_0; // @[CSR.scala 32:45:@292.4]
  assign _T_200 = io_bus_addr == 4'h2; // @[CSR.scala 32:22:@309.4]
  assign _T_201 = _T_200 & io_bus_read; // @[CSR.scala 32:30:@310.4]
  assign _GEN_8 = _T_201 ? io_csr_2_dataIn : _GEN_4; // @[CSR.scala 32:45:@311.4]
  assign _T_206 = _T_200 & io_bus_write; // @[CSR.scala 39:30:@319.4]
  assign _T_211 = io_bus_addr == 4'h3; // @[CSR.scala 32:22:@328.4]
  assign _T_212 = _T_211 & io_bus_read; // @[CSR.scala 32:30:@329.4]
  assign _GEN_12 = _T_212 ? io_csr_3_dataIn : _GEN_8; // @[CSR.scala 32:45:@330.4]
  assign _T_217 = _T_211 & io_bus_write; // @[CSR.scala 39:30:@338.4]
  assign _T_222 = io_bus_addr == 4'h4; // @[CSR.scala 32:22:@347.4]
  assign _T_223 = _T_222 & io_bus_read; // @[CSR.scala 32:30:@348.4]
  assign _GEN_16 = _T_223 ? io_csr_4_dataIn : _GEN_12; // @[CSR.scala 32:45:@349.4]
  assign _T_228 = _T_222 & io_bus_write; // @[CSR.scala 39:30:@357.4]
  assign _T_233 = io_bus_addr == 4'h5; // @[CSR.scala 32:22:@366.4]
  assign _T_234 = _T_233 & io_bus_read; // @[CSR.scala 32:30:@367.4]
  assign _GEN_20 = _T_234 ? io_csr_5_dataIn : _GEN_16; // @[CSR.scala 32:45:@368.4]
  assign _T_239 = _T_233 & io_bus_write; // @[CSR.scala 39:30:@376.4]
  assign _T_244 = io_bus_addr == 4'h6; // @[CSR.scala 32:22:@385.4]
  assign _T_245 = _T_244 & io_bus_read; // @[CSR.scala 32:30:@386.4]
  assign _GEN_24 = _T_245 ? io_csr_6_dataIn : _GEN_20; // @[CSR.scala 32:45:@387.4]
  assign _T_250 = _T_244 & io_bus_write; // @[CSR.scala 39:30:@395.4]
  assign _T_255 = io_bus_addr == 4'h7; // @[CSR.scala 32:22:@404.4]
  assign _T_256 = _T_255 & io_bus_read; // @[CSR.scala 32:30:@405.4]
  assign _GEN_28 = _T_256 ? io_csr_7_dataIn : _GEN_24; // @[CSR.scala 32:45:@406.4]
  assign _T_261 = _T_255 & io_bus_write; // @[CSR.scala 39:30:@414.4]
  assign _T_266 = io_bus_addr == 4'h8; // @[CSR.scala 32:22:@423.4]
  assign _T_267 = _T_266 & io_bus_read; // @[CSR.scala 32:30:@424.4]
  assign _GEN_32 = _T_267 ? io_csr_8_dataIn : _GEN_28; // @[CSR.scala 32:45:@425.4]
  assign _T_272 = _T_266 & io_bus_write; // @[CSR.scala 39:30:@433.4]
  assign _T_277 = io_bus_addr == 4'h9; // @[CSR.scala 32:22:@442.4]
  assign _T_278 = _T_277 & io_bus_read; // @[CSR.scala 32:30:@443.4]
  assign _GEN_36 = _T_278 ? io_csr_9_dataIn : _GEN_32; // @[CSR.scala 32:45:@444.4]
  assign _T_283 = _T_277 & io_bus_write; // @[CSR.scala 39:30:@452.4]
  assign _T_288 = io_bus_addr == 4'ha; // @[CSR.scala 32:22:@461.4]
  assign _T_289 = _T_288 & io_bus_read; // @[CSR.scala 32:30:@462.4]
  assign _GEN_40 = _T_289 ? io_csr_10_dataIn : _GEN_36; // @[CSR.scala 32:45:@463.4]
  assign _T_294 = _T_288 & io_bus_write; // @[CSR.scala 39:30:@471.4]
  assign _T_299 = io_bus_addr == 4'hb; // @[CSR.scala 32:22:@480.4]
  assign _T_300 = _T_299 & io_bus_read; // @[CSR.scala 32:30:@481.4]
  assign _GEN_44 = _T_300 ? io_csr_11_dataIn : _GEN_40; // @[CSR.scala 32:45:@482.4]
  assign _T_305 = _T_299 & io_bus_write; // @[CSR.scala 39:30:@490.4]
  assign _T_310 = io_bus_addr == 4'hc; // @[CSR.scala 32:22:@499.4]
  assign _T_311 = _T_310 & io_bus_read; // @[CSR.scala 32:30:@500.4]
  assign _GEN_48 = _T_311 ? io_csr_12_dataIn : _GEN_44; // @[CSR.scala 32:45:@501.4]
  assign _T_321 = io_bus_addr == 4'hd; // @[CSR.scala 32:22:@518.4]
  assign _T_322 = _T_321 & io_bus_read; // @[CSR.scala 32:30:@519.4]
  assign _GEN_52 = _T_322 ? io_csr_13_dataIn : _GEN_48; // @[CSR.scala 32:45:@520.4]
  assign _T_332 = io_bus_addr == 4'he; // @[CSR.scala 32:22:@537.4]
  assign _T_333 = _T_332 & io_bus_read; // @[CSR.scala 32:30:@538.4]
  assign _GEN_56 = _T_333 ? io_csr_14_dataIn : _GEN_52; // @[CSR.scala 32:45:@539.4]
  assign _T_338 = _T_332 & io_bus_write; // @[CSR.scala 39:30:@547.4]
  assign _T_343 = io_bus_addr == 4'hf; // @[CSR.scala 32:22:@556.4]
  assign _T_344 = _T_343 & io_bus_read; // @[CSR.scala 32:30:@557.4]
  assign _T_349 = _T_343 & io_bus_write; // @[CSR.scala 39:30:@566.4]
  assign io_csr_0_dataOut = _T_184 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@283.6 CSR.scala 44:25:@288.6]
  assign io_csr_0_dataWrite = _T_178 & io_bus_write; // @[CSR.scala 41:27:@284.6 CSR.scala 43:27:@287.6]
  assign io_csr_2_dataOut = _T_206 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@321.6 CSR.scala 44:25:@326.6]
  assign io_csr_2_dataWrite = _T_200 & io_bus_write; // @[CSR.scala 41:27:@322.6 CSR.scala 43:27:@325.6]
  assign io_csr_3_dataOut = _T_217 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@340.6 CSR.scala 44:25:@345.6]
  assign io_csr_3_dataWrite = _T_211 & io_bus_write; // @[CSR.scala 41:27:@341.6 CSR.scala 43:27:@344.6]
  assign io_csr_4_dataOut = _T_228 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@359.6 CSR.scala 44:25:@364.6]
  assign io_csr_4_dataWrite = _T_222 & io_bus_write; // @[CSR.scala 41:27:@360.6 CSR.scala 43:27:@363.6]
  assign io_csr_5_dataOut = _T_239 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@378.6 CSR.scala 44:25:@383.6]
  assign io_csr_5_dataWrite = _T_233 & io_bus_write; // @[CSR.scala 41:27:@379.6 CSR.scala 43:27:@382.6]
  assign io_csr_6_dataOut = _T_250 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@397.6 CSR.scala 44:25:@402.6]
  assign io_csr_6_dataWrite = _T_244 & io_bus_write; // @[CSR.scala 41:27:@398.6 CSR.scala 43:27:@401.6]
  assign io_csr_7_dataOut = _T_261 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@416.6 CSR.scala 44:25:@421.6]
  assign io_csr_7_dataWrite = _T_255 & io_bus_write; // @[CSR.scala 41:27:@417.6 CSR.scala 43:27:@420.6]
  assign io_csr_8_dataOut = _T_272 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@435.6 CSR.scala 44:25:@440.6]
  assign io_csr_8_dataWrite = _T_266 & io_bus_write; // @[CSR.scala 41:27:@436.6 CSR.scala 43:27:@439.6]
  assign io_csr_9_dataOut = _T_283 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@454.6 CSR.scala 44:25:@459.6]
  assign io_csr_9_dataWrite = _T_277 & io_bus_write; // @[CSR.scala 41:27:@455.6 CSR.scala 43:27:@458.6]
  assign io_csr_10_dataOut = _T_294 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@473.6 CSR.scala 44:25:@478.6]
  assign io_csr_10_dataWrite = _T_288 & io_bus_write; // @[CSR.scala 41:27:@474.6 CSR.scala 43:27:@477.6]
  assign io_csr_11_dataOut = _T_305 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@492.6 CSR.scala 44:25:@497.6]
  assign io_csr_11_dataWrite = _T_299 & io_bus_write; // @[CSR.scala 41:27:@493.6 CSR.scala 43:27:@496.6]
  assign io_csr_14_dataOut = _T_338 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@549.6 CSR.scala 44:25:@554.6]
  assign io_csr_14_dataWrite = _T_332 & io_bus_write; // @[CSR.scala 41:27:@550.6 CSR.scala 43:27:@553.6]
  assign io_csr_15_dataOut = _T_349 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@568.6 CSR.scala 44:25:@573.6]
  assign io_csr_15_dataWrite = _T_343 & io_bus_write; // @[CSR.scala 41:27:@569.6 CSR.scala 43:27:@572.6]
  assign io_bus_dataIn = _T_344 ? io_csr_15_dataIn : _GEN_56; // @[CSR.scala 29:17:@270.4]
endmodule
module AddressGeneratorAXIS_WB_AXI( // @[:@576.2]
  input         clock, // @[:@577.4]
  input         reset, // @[:@578.4]
  input         io_ctl_start, // @[:@579.4]
  output        io_ctl_busy, // @[:@579.4]
  input  [31:0] io_ctl_startAddress, // @[:@579.4]
  input  [31:0] io_ctl_lineLength, // @[:@579.4]
  input  [31:0] io_ctl_lineCount, // @[:@579.4]
  input  [31:0] io_ctl_lineGap, // @[:@579.4]
  input         io_xfer_done, // @[:@579.4]
  output [31:0] io_xfer_address, // @[:@579.4]
  output [31:0] io_xfer_length, // @[:@579.4]
  output        io_xfer_valid // @[:@579.4]
);
  reg [1:0] state; // @[AddressGenerator.scala 29:22:@581.4]
  reg [31:0] _RAND_0;
  reg [31:0] lineCount; // @[AddressGenerator.scala 31:26:@582.4]
  reg [31:0] _RAND_1;
  reg [31:0] lineGap; // @[AddressGenerator.scala 32:24:@583.4]
  reg [31:0] _RAND_2;
  reg [31:0] address_o; // @[AddressGenerator.scala 34:26:@584.4]
  reg [31:0] _RAND_3;
  reg [31:0] address_i; // @[AddressGenerator.scala 35:26:@585.4]
  reg [31:0] _RAND_4;
  reg [31:0] length_o; // @[AddressGenerator.scala 36:25:@586.4]
  reg [31:0] _RAND_5;
  reg [31:0] length_i; // @[AddressGenerator.scala 37:25:@587.4]
  reg [31:0] _RAND_6;
  reg  valid; // @[AddressGenerator.scala 38:22:@588.4]
  reg [31:0] _RAND_7;
  reg  busy; // @[AddressGenerator.scala 40:21:@590.4]
  reg [31:0] _RAND_8;
  wire  _T_46; // @[AddressGenerator.scala 48:14:@596.4]
  wire  _GEN_0; // @[AddressGenerator.scala 48:24:@597.4]
  wire  _T_49; // @[Conditional.scala 37:30:@603.4]
  wire [1:0] _GEN_1; // @[AddressGenerator.scala 56:25:@605.6]
  wire [31:0] _GEN_2; // @[AddressGenerator.scala 56:25:@605.6]
  wire [31:0] _GEN_3; // @[AddressGenerator.scala 56:25:@605.6]
  wire [31:0] _GEN_4; // @[AddressGenerator.scala 56:25:@605.6]
  wire [31:0] _GEN_5; // @[AddressGenerator.scala 56:25:@605.6]
  wire  _T_51; // @[Conditional.scala 37:30:@615.6]
  wire [34:0] _T_54; // @[AddressGenerator.scala 71:42:@620.8]
  wire [34:0] _GEN_28; // @[AddressGenerator.scala 71:30:@621.8]
  wire [35:0] _T_55; // @[AddressGenerator.scala 71:30:@621.8]
  wire [34:0] _T_56; // @[AddressGenerator.scala 71:30:@622.8]
  wire [34:0] _T_58; // @[AddressGenerator.scala 71:74:@623.8]
  wire [35:0] _T_59; // @[AddressGenerator.scala 71:63:@624.8]
  wire [34:0] _T_60; // @[AddressGenerator.scala 71:63:@625.8]
  wire [32:0] _T_62; // @[AddressGenerator.scala 73:30:@627.8]
  wire [32:0] _T_63; // @[AddressGenerator.scala 73:30:@628.8]
  wire [31:0] _T_64; // @[AddressGenerator.scala 73:30:@629.8]
  wire  _T_65; // @[Conditional.scala 37:30:@634.8]
  wire  _T_69; // @[AddressGenerator.scala 80:24:@639.12]
  wire [1:0] _GEN_7; // @[AddressGenerator.scala 80:30:@640.12]
  wire [1:0] _GEN_8; // @[AddressGenerator.scala 79:25:@638.10]
  wire  _GEN_9; // @[Conditional.scala 39:67:@635.8]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@635.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@616.6]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@616.6]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@616.6]
  wire [34:0] _GEN_15; // @[Conditional.scala 39:67:@616.6]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@616.6]
  wire [1:0] _GEN_17; // @[Conditional.scala 39:67:@616.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 40:58:@604.4]
  wire [34:0] _GEN_20; // @[Conditional.scala 40:58:@604.4]
  wire [31:0] _GEN_21; // @[Conditional.scala 40:58:@604.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@604.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@604.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@604.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@604.4]
  wire [31:0] _GEN_27; // @[Conditional.scala 40:58:@604.4]
  assign _T_46 = state == 2'h0; // @[AddressGenerator.scala 48:14:@596.4]
  assign _GEN_0 = _T_46 ? 1'h0 : 1'h1; // @[AddressGenerator.scala 48:24:@597.4]
  assign _T_49 = 2'h0 == state; // @[Conditional.scala 37:30:@603.4]
  assign _GEN_1 = io_ctl_start ? 2'h1 : state; // @[AddressGenerator.scala 56:25:@605.6]
  assign _GEN_2 = io_ctl_start ? io_ctl_startAddress : address_i; // @[AddressGenerator.scala 56:25:@605.6]
  assign _GEN_3 = io_ctl_start ? io_ctl_lineLength : length_i; // @[AddressGenerator.scala 56:25:@605.6]
  assign _GEN_4 = io_ctl_start ? io_ctl_lineCount : lineCount; // @[AddressGenerator.scala 56:25:@605.6]
  assign _GEN_5 = io_ctl_start ? io_ctl_lineGap : lineGap; // @[AddressGenerator.scala 56:25:@605.6]
  assign _T_51 = 2'h1 == state; // @[Conditional.scala 37:30:@615.6]
  assign _T_54 = length_i * 32'h4; // @[AddressGenerator.scala 71:42:@620.8]
  assign _GEN_28 = {{3'd0}, address_i}; // @[AddressGenerator.scala 71:30:@621.8]
  assign _T_55 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@621.8]
  assign _T_56 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@622.8]
  assign _T_58 = lineGap * 32'h4; // @[AddressGenerator.scala 71:74:@623.8]
  assign _T_59 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@624.8]
  assign _T_60 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@625.8]
  assign _T_62 = lineCount - 32'h1; // @[AddressGenerator.scala 73:30:@627.8]
  assign _T_63 = $unsigned(_T_62); // @[AddressGenerator.scala 73:30:@628.8]
  assign _T_64 = _T_63[31:0]; // @[AddressGenerator.scala 73:30:@629.8]
  assign _T_65 = 2'h2 == state; // @[Conditional.scala 37:30:@634.8]
  assign _T_69 = lineCount > 32'h0; // @[AddressGenerator.scala 80:24:@639.12]
  assign _GEN_7 = _T_69 ? 2'h1 : 2'h0; // @[AddressGenerator.scala 80:30:@640.12]
  assign _GEN_8 = io_xfer_done ? _GEN_7 : state; // @[AddressGenerator.scala 79:25:@638.10]
  assign _GEN_9 = _T_65 ? 1'h0 : valid; // @[Conditional.scala 39:67:@635.8]
  assign _GEN_11 = _T_65 ? _GEN_8 : state; // @[Conditional.scala 39:67:@635.8]
  assign _GEN_12 = _T_51 ? 1'h1 : _GEN_9; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_13 = _T_51 ? address_i : address_o; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_14 = _T_51 ? length_i : length_o; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_15 = _T_51 ? _T_60 : {{3'd0}, address_i}; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_16 = _T_51 ? _T_64 : lineCount; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_17 = _T_51 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67:@616.6]
  assign _GEN_19 = _T_49 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_20 = _T_49 ? {{3'd0}, _GEN_2} : _GEN_15; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_21 = _T_49 ? _GEN_3 : length_i; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_22 = _T_49 ? _GEN_4 : _GEN_16; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_23 = _T_49 ? _GEN_5 : lineGap; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_25 = _T_49 ? valid : _GEN_12; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_26 = _T_49 ? address_o : _GEN_13; // @[Conditional.scala 40:58:@604.4]
  assign _GEN_27 = _T_49 ? length_o : _GEN_14; // @[Conditional.scala 40:58:@604.4]
  assign io_ctl_busy = busy; // @[AddressGenerator.scala 46:15:@595.4]
  assign io_xfer_address = address_o; // @[AddressGenerator.scala 42:19:@591.4]
  assign io_xfer_length = length_o; // @[AddressGenerator.scala 43:18:@592.4]
  assign io_xfer_valid = valid; // @[AddressGenerator.scala 44:17:@593.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  lineCount = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  lineGap = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  address_o = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  address_i = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  length_o = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  length_i = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  busy = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_51) begin
          state <= 2'h2;
        end else begin
          if (_T_65) begin
            if (io_xfer_done) begin
              if (_T_69) begin
                state <= 2'h1;
              end else begin
                state <= 2'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      lineCount <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          lineCount <= io_ctl_lineCount;
        end
      end else begin
        if (_T_51) begin
          lineCount <= _T_64;
        end
      end
    end
    if (reset) begin
      lineGap <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          lineGap <= io_ctl_lineGap;
        end
      end
    end
    if (reset) begin
      address_o <= 32'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          address_o <= address_i;
        end
      end
    end
    if (reset) begin
      address_i <= 32'h0;
    end else begin
      address_i <= _GEN_20[31:0];
    end
    if (reset) begin
      length_o <= 32'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          length_o <= length_i;
        end
      end
    end
    if (reset) begin
      length_i <= 32'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          length_i <= io_ctl_lineLength;
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (!(_T_49)) begin
        if (_T_51) begin
          valid <= 1'h1;
        end else begin
          if (_T_65) begin
            valid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      busy <= 1'h0;
    end else begin
      if (_T_46) begin
        busy <= 1'h0;
      end else begin
        busy <= 1'h1;
      end
    end
  end
endmodule
module TransferSplitterAXIS_WB_AXI( // @[:@649.2]
  output        io_xferIn_done, // @[:@652.4]
  input  [31:0] io_xferIn_length, // @[:@652.4]
  input         io_xferIn_valid, // @[:@652.4]
  input         io_xferOut_done, // @[:@652.4]
  output [31:0] io_xferOut_length, // @[:@652.4]
  output        io_xferOut_valid // @[:@652.4]
);
  assign io_xferIn_done = io_xferOut_done; // @[TransferSplitter.scala 124:16:@658.4]
  assign io_xferOut_length = io_xferIn_length; // @[TransferSplitter.scala 124:16:@656.4]
  assign io_xferOut_valid = io_xferIn_valid; // @[TransferSplitter.scala 124:16:@655.4]
endmodule
module TransferSplitterAXIS_WB_AXI_1( // @[:@733.2]
  input         clock, // @[:@734.4]
  input         reset, // @[:@735.4]
  output        io_xferIn_done, // @[:@736.4]
  input  [31:0] io_xferIn_address, // @[:@736.4]
  input  [31:0] io_xferIn_length, // @[:@736.4]
  input         io_xferIn_valid, // @[:@736.4]
  input         io_xferOut_done, // @[:@736.4]
  output [31:0] io_xferOut_address, // @[:@736.4]
  output [31:0] io_xferOut_length, // @[:@736.4]
  output        io_xferOut_valid // @[:@736.4]
);
  reg [31:0] _T_42; // @[TransferSplitter.scala 35:28:@738.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_45; // @[TransferSplitter.scala 36:27:@739.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_48; // @[TransferSplitter.scala 38:28:@740.4]
  reg [31:0] _RAND_2;
  reg [31:0] _T_51; // @[TransferSplitter.scala 39:27:@741.4]
  reg [31:0] _RAND_3;
  reg  _T_60; // @[TransferSplitter.scala 44:23:@744.4]
  reg [31:0] _RAND_4;
  reg  _T_63; // @[TransferSplitter.scala 45:24:@745.4]
  reg [31:0] _RAND_5;
  reg [1:0] _T_65; // @[TransferSplitter.scala 47:24:@746.4]
  reg [31:0] _RAND_6;
  wire  _T_66; // @[Conditional.scala 37:30:@752.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 60:31:@755.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 60:31:@755.6]
  wire [1:0] _GEN_3; // @[TransferSplitter.scala 60:31:@755.6]
  wire  _T_68; // @[Conditional.scala 37:30:@763.6]
  wire  _T_71; // @[TransferSplitter.scala 73:23:@769.8]
  wire [32:0] _T_74; // @[TransferSplitter.scala 76:34:@772.10]
  wire [32:0] _T_75; // @[TransferSplitter.scala 76:34:@773.10]
  wire [31:0] _T_76; // @[TransferSplitter.scala 76:34:@774.10]
  wire [11:0] _T_79; // @[TransferSplitter.scala 77:50:@776.10]
  wire [31:0] _GEN_33; // @[TransferSplitter.scala 77:36:@777.10]
  wire [32:0] _T_80; // @[TransferSplitter.scala 77:36:@777.10]
  wire [31:0] _T_81; // @[TransferSplitter.scala 77:36:@778.10]
  wire [34:0] _T_84; // @[TransferSplitter.scala 95:47:@784.10]
  wire [34:0] _GEN_34; // @[TransferSplitter.scala 95:36:@785.10]
  wire [35:0] _T_85; // @[TransferSplitter.scala 95:36:@785.10]
  wire [34:0] _T_86; // @[TransferSplitter.scala 95:36:@786.10]
  wire [31:0] _GEN_4; // @[TransferSplitter.scala 73:38:@770.8]
  wire [31:0] _GEN_5; // @[TransferSplitter.scala 73:38:@770.8]
  wire [34:0] _GEN_6; // @[TransferSplitter.scala 73:38:@770.8]
  wire  _T_87; // @[Conditional.scala 37:30:@791.8]
  wire  _T_91; // @[TransferSplitter.scala 114:25:@796.12]
  wire [1:0] _GEN_7; // @[TransferSplitter.scala 114:32:@797.12]
  wire  _GEN_8; // @[TransferSplitter.scala 114:32:@797.12]
  wire [1:0] _GEN_9; // @[TransferSplitter.scala 113:31:@795.10]
  wire  _GEN_10; // @[TransferSplitter.scala 113:31:@795.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@792.8]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@792.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@792.8]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@764.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@764.6]
  wire [1:0] _GEN_18; // @[Conditional.scala 39:67:@764.6]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@764.6]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@764.6]
  wire [34:0] _GEN_21; // @[Conditional.scala 39:67:@764.6]
  wire  _GEN_23; // @[Conditional.scala 39:67:@764.6]
  wire  _GEN_24; // @[Conditional.scala 40:58:@753.4]
  wire [34:0] _GEN_25; // @[Conditional.scala 40:58:@753.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@753.4]
  wire [1:0] _GEN_28; // @[Conditional.scala 40:58:@753.4]
  wire [31:0] _GEN_29; // @[Conditional.scala 40:58:@753.4]
  wire  _GEN_31; // @[Conditional.scala 40:58:@753.4]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58:@753.4]
  assign _T_66 = 2'h0 == _T_65; // @[Conditional.scala 37:30:@752.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_42; // @[TransferSplitter.scala 60:31:@755.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_45; // @[TransferSplitter.scala 60:31:@755.6]
  assign _GEN_3 = io_xferIn_valid ? 2'h1 : _T_65; // @[TransferSplitter.scala 60:31:@755.6]
  assign _T_68 = 2'h1 == _T_65; // @[Conditional.scala 37:30:@763.6]
  assign _T_71 = _T_45 > 32'h100; // @[TransferSplitter.scala 73:23:@769.8]
  assign _T_74 = _T_45 - 32'h100; // @[TransferSplitter.scala 76:34:@772.10]
  assign _T_75 = $unsigned(_T_74); // @[TransferSplitter.scala 76:34:@773.10]
  assign _T_76 = _T_75[31:0]; // @[TransferSplitter.scala 76:34:@774.10]
  assign _T_79 = 9'h100 * 9'h4; // @[TransferSplitter.scala 77:50:@776.10]
  assign _GEN_33 = {{20'd0}, _T_79}; // @[TransferSplitter.scala 77:36:@777.10]
  assign _T_80 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@777.10]
  assign _T_81 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@778.10]
  assign _T_84 = _T_45 * 32'h4; // @[TransferSplitter.scala 95:47:@784.10]
  assign _GEN_34 = {{3'd0}, _T_42}; // @[TransferSplitter.scala 95:36:@785.10]
  assign _T_85 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@785.10]
  assign _T_86 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@786.10]
  assign _GEN_4 = _T_71 ? 32'h100 : _T_45; // @[TransferSplitter.scala 73:38:@770.8]
  assign _GEN_5 = _T_71 ? _T_76 : 32'h0; // @[TransferSplitter.scala 73:38:@770.8]
  assign _GEN_6 = _T_71 ? {{3'd0}, _T_81} : _T_86; // @[TransferSplitter.scala 73:38:@770.8]
  assign _T_87 = 2'h2 == _T_65; // @[Conditional.scala 37:30:@791.8]
  assign _T_91 = _T_45 > 32'h0; // @[TransferSplitter.scala 114:25:@796.12]
  assign _GEN_7 = _T_91 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 114:32:@797.12]
  assign _GEN_8 = _T_91 ? _T_60 : 1'h1; // @[TransferSplitter.scala 114:32:@797.12]
  assign _GEN_9 = io_xferOut_done ? _GEN_7 : _T_65; // @[TransferSplitter.scala 113:31:@795.10]
  assign _GEN_10 = io_xferOut_done ? _GEN_8 : _T_60; // @[TransferSplitter.scala 113:31:@795.10]
  assign _GEN_11 = _T_87 ? 1'h0 : _T_63; // @[Conditional.scala 39:67:@792.8]
  assign _GEN_13 = _T_87 ? _GEN_9 : _T_65; // @[Conditional.scala 39:67:@792.8]
  assign _GEN_14 = _T_87 ? _GEN_10 : _T_60; // @[Conditional.scala 39:67:@792.8]
  assign _GEN_15 = _T_68 ? _T_42 : _T_48; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_17 = _T_68 ? 1'h1 : _GEN_11; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_18 = _T_68 ? 2'h2 : _GEN_13; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_19 = _T_68 ? _GEN_4 : _T_51; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_20 = _T_68 ? _GEN_5 : _T_45; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_21 = _T_68 ? _GEN_6 : {{3'd0}, _T_42}; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_23 = _T_68 ? _T_60 : _GEN_14; // @[Conditional.scala 39:67:@764.6]
  assign _GEN_24 = _T_66 ? 1'h0 : _GEN_23; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_25 = _T_66 ? {{3'd0}, _GEN_0} : _GEN_21; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_26 = _T_66 ? _GEN_1 : _GEN_20; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_28 = _T_66 ? _GEN_3 : _GEN_18; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_29 = _T_66 ? _T_48 : _GEN_15; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_31 = _T_66 ? _T_63 : _GEN_17; // @[Conditional.scala 40:58:@753.4]
  assign _GEN_32 = _T_66 ? _T_51 : _GEN_19; // @[Conditional.scala 40:58:@753.4]
  assign io_xferIn_done = _T_60; // @[TransferSplitter.scala 49:20:@747.4]
  assign io_xferOut_address = _T_48; // @[TransferSplitter.scala 53:24:@750.4]
  assign io_xferOut_length = _T_51; // @[TransferSplitter.scala 54:23:@751.4]
  assign io_xferOut_valid = _T_63; // @[TransferSplitter.scala 50:22:@748.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_42 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_45 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_48 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_51 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_60 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_63 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_65 = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_42 <= 32'h0;
    end else begin
      _T_42 <= _GEN_25[31:0];
    end
    if (reset) begin
      _T_45 <= 32'h0;
    end else begin
      if (_T_66) begin
        if (io_xferIn_valid) begin
          _T_45 <= io_xferIn_length;
        end
      end else begin
        if (_T_68) begin
          if (_T_71) begin
            _T_45 <= _T_76;
          end else begin
            _T_45 <= 32'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_48 <= 32'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          _T_48 <= _T_42;
        end
      end
    end
    if (reset) begin
      _T_51 <= 32'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          if (_T_71) begin
            _T_51 <= 32'h100;
          end else begin
            _T_51 <= _T_45;
          end
        end
      end
    end
    if (reset) begin
      _T_60 <= 1'h0;
    end else begin
      if (_T_66) begin
        _T_60 <= 1'h0;
      end else begin
        if (!(_T_68)) begin
          if (_T_87) begin
            if (io_xferOut_done) begin
              if (!(_T_91)) begin
                _T_60 <= 1'h1;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      _T_63 <= 1'h0;
    end else begin
      if (!(_T_66)) begin
        if (_T_68) begin
          _T_63 <= 1'h1;
        end else begin
          if (_T_87) begin
            _T_63 <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_65 <= 2'h0;
    end else begin
      if (_T_66) begin
        if (io_xferIn_valid) begin
          _T_65 <= 2'h1;
        end
      end else begin
        if (_T_68) begin
          _T_65 <= 2'h2;
        end else begin
          if (_T_87) begin
            if (io_xferOut_done) begin
              if (_T_91) begin
                _T_65 <= 2'h1;
              end else begin
                _T_65 <= 2'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
module ClearCSRAXIS_WB_AXI( // @[:@807.2]
  input         clock, // @[:@808.4]
  input         reset, // @[:@809.4]
  input  [31:0] io_csr_dataOut, // @[:@810.4]
  input         io_csr_dataWrite, // @[:@810.4]
  output [31:0] io_csr_dataIn, // @[:@810.4]
  output [31:0] io_value, // @[:@810.4]
  input  [31:0] io_clear // @[:@810.4]
);
  reg [31:0] reg$; // @[ClearCSR.scala 28:20:@812.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[ClearCSR.scala 36:19:@819.6]
  wire [31:0] _T_30; // @[ClearCSR.scala 36:16:@820.6]
  wire [31:0] _GEN_0; // @[ClearCSR.scala 33:25:@815.4]
  assign _T_29 = ~ io_clear; // @[ClearCSR.scala 36:19:@819.6]
  assign _T_30 = reg$ & _T_29; // @[ClearCSR.scala 36:16:@820.6]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : _T_30; // @[ClearCSR.scala 33:25:@815.4]
  assign io_csr_dataIn = reg$; // @[ClearCSR.scala 30:17:@813.4]
  assign io_value = reg$; // @[ClearCSR.scala 31:12:@814.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end else begin
        reg$ <= _T_30;
      end
    end
  end
endmodule
module StatusCSRAXIS_WB_AXI( // @[:@824.2]
  input         clock, // @[:@825.4]
  output [31:0] io_csr_dataIn, // @[:@827.4]
  input  [31:0] io_value // @[:@827.4]
);
  reg [31:0] reg$; // @[StatusCSR.scala 27:20:@829.4]
  reg [31:0] _RAND_0;
  assign io_csr_dataIn = reg$; // @[StatusCSR.scala 29:17:@831.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    reg$ <= io_value;
  end
endmodule
module SimpleCSRAXIS_WB_AXI( // @[:@833.2]
  input         clock, // @[:@834.4]
  input         reset, // @[:@835.4]
  input  [31:0] io_csr_dataOut, // @[:@836.4]
  input         io_csr_dataWrite, // @[:@836.4]
  output [31:0] io_csr_dataIn, // @[:@836.4]
  output [31:0] io_value // @[:@836.4]
);
  reg [31:0] reg$; // @[SimpleCSR.scala 27:20:@838.4]
  reg [31:0] _RAND_0;
  wire [31:0] _GEN_0; // @[SimpleCSR.scala 32:25:@841.4]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : reg$; // @[SimpleCSR.scala 32:25:@841.4]
  assign io_csr_dataIn = reg$; // @[SimpleCSR.scala 29:17:@839.4]
  assign io_value = reg$; // @[SimpleCSR.scala 30:12:@840.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end
    end
  end
endmodule
module SetCSRAXIS_WB_AXI( // @[:@845.2]
  input         clock, // @[:@846.4]
  input         reset, // @[:@847.4]
  input  [31:0] io_csr_dataOut, // @[:@848.4]
  input         io_csr_dataWrite, // @[:@848.4]
  output [31:0] io_csr_dataIn, // @[:@848.4]
  output [31:0] io_value, // @[:@848.4]
  input  [31:0] io_set // @[:@848.4]
);
  reg [31:0] reg$; // @[SetCSR.scala 28:20:@850.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[SetCSR.scala 34:20:@854.6]
  wire [31:0] _T_30; // @[SetCSR.scala 34:17:@855.6]
  wire [31:0] _T_31; // @[SetCSR.scala 34:45:@856.6]
  wire [31:0] _T_32; // @[SetCSR.scala 36:16:@860.6]
  wire [31:0] _GEN_0; // @[SetCSR.scala 33:25:@853.4]
  assign _T_29 = ~ io_csr_dataOut; // @[SetCSR.scala 34:20:@854.6]
  assign _T_30 = reg$ & _T_29; // @[SetCSR.scala 34:17:@855.6]
  assign _T_31 = _T_30 | io_set; // @[SetCSR.scala 34:45:@856.6]
  assign _T_32 = reg$ | io_set; // @[SetCSR.scala 36:16:@860.6]
  assign _GEN_0 = io_csr_dataWrite ? _T_31 : _T_32; // @[SetCSR.scala 33:25:@853.4]
  assign io_csr_dataIn = reg$; // @[SetCSR.scala 30:17:@851.4]
  assign io_value = reg$; // @[SetCSR.scala 31:12:@852.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= _T_31;
      end else begin
        reg$ <= _T_32;
      end
    end
  end
endmodule
module InterruptControllerAXIS_WB_AXI( // @[:@864.2]
  input         clock, // @[:@865.4]
  input         reset, // @[:@866.4]
  output        io_irq_readerDone, // @[:@867.4]
  output        io_irq_writerDone, // @[:@867.4]
  input         io_readBusy, // @[:@867.4]
  input         io_writeBusy, // @[:@867.4]
  input  [31:0] io_imr_dataOut, // @[:@867.4]
  input         io_imr_dataWrite, // @[:@867.4]
  output [31:0] io_imr_dataIn, // @[:@867.4]
  input  [31:0] io_isr_dataOut, // @[:@867.4]
  input         io_isr_dataWrite, // @[:@867.4]
  output [31:0] io_isr_dataIn // @[:@867.4]
);
  wire  SimpleCSRAXIS_WB_AXI_clock; // @[SimpleCSR.scala 40:21:@869.4]
  wire  SimpleCSRAXIS_WB_AXI_reset; // @[SimpleCSR.scala 40:21:@869.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@869.4]
  wire  SimpleCSRAXIS_WB_AXI_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@869.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@869.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_value; // @[SimpleCSR.scala 40:21:@869.4]
  wire  SetCSRAXIS_WB_AXI_clock; // @[SetCSR.scala 43:21:@901.4]
  wire  SetCSRAXIS_WB_AXI_reset; // @[SetCSR.scala 43:21:@901.4]
  wire [31:0] SetCSRAXIS_WB_AXI_io_csr_dataOut; // @[SetCSR.scala 43:21:@901.4]
  wire  SetCSRAXIS_WB_AXI_io_csr_dataWrite; // @[SetCSR.scala 43:21:@901.4]
  wire [31:0] SetCSRAXIS_WB_AXI_io_csr_dataIn; // @[SetCSR.scala 43:21:@901.4]
  wire [31:0] SetCSRAXIS_WB_AXI_io_value; // @[SetCSR.scala 43:21:@901.4]
  wire [31:0] SetCSRAXIS_WB_AXI_io_set; // @[SetCSR.scala 43:21:@901.4]
  reg  readBusy; // @[InterruptController.scala 33:25:@878.4]
  reg [31:0] _RAND_0;
  reg  readBusyOld; // @[InterruptController.scala 34:28:@880.4]
  reg [31:0] _RAND_1;
  reg  writeBusy; // @[InterruptController.scala 36:26:@882.4]
  reg [31:0] _RAND_2;
  reg  writeBusyOld; // @[InterruptController.scala 37:29:@884.4]
  reg [31:0] _RAND_3;
  reg  writeBusyIrq; // @[InterruptController.scala 39:29:@886.4]
  reg [31:0] _RAND_4;
  reg  readBusyIrq; // @[InterruptController.scala 40:28:@887.4]
  reg [31:0] _RAND_5;
  wire  _T_59; // @[InterruptController.scala 42:35:@888.4]
  wire  _T_60; // @[InterruptController.scala 42:32:@889.4]
  wire [31:0] mask; // @[:@876.4 :@877.4]
  wire  _T_61; // @[InterruptController.scala 42:53:@890.4]
  wire  _T_62; // @[InterruptController.scala 42:46:@891.4]
  wire  _T_64; // @[InterruptController.scala 43:33:@893.4]
  wire  _T_65; // @[InterruptController.scala 43:30:@894.4]
  wire  _T_66; // @[InterruptController.scala 43:50:@895.4]
  wire  _T_67; // @[InterruptController.scala 43:43:@896.4]
  wire [1:0] irq; // @[Cat.scala 30:58:@898.4]
  wire [31:0] isr; // @[:@909.4 :@910.4]
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI ( // @[SimpleCSR.scala 40:21:@869.4]
    .clock(SimpleCSRAXIS_WB_AXI_clock),
    .reset(SimpleCSRAXIS_WB_AXI_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_io_value)
  );
  SetCSRAXIS_WB_AXI SetCSRAXIS_WB_AXI ( // @[SetCSR.scala 43:21:@901.4]
    .clock(SetCSRAXIS_WB_AXI_clock),
    .reset(SetCSRAXIS_WB_AXI_reset),
    .io_csr_dataOut(SetCSRAXIS_WB_AXI_io_csr_dataOut),
    .io_csr_dataWrite(SetCSRAXIS_WB_AXI_io_csr_dataWrite),
    .io_csr_dataIn(SetCSRAXIS_WB_AXI_io_csr_dataIn),
    .io_value(SetCSRAXIS_WB_AXI_io_value),
    .io_set(SetCSRAXIS_WB_AXI_io_set)
  );
  assign _T_59 = writeBusy == 1'h0; // @[InterruptController.scala 42:35:@888.4]
  assign _T_60 = writeBusyOld & _T_59; // @[InterruptController.scala 42:32:@889.4]
  assign mask = SimpleCSRAXIS_WB_AXI_io_value; // @[:@876.4 :@877.4]
  assign _T_61 = mask[0]; // @[InterruptController.scala 42:53:@890.4]
  assign _T_62 = _T_60 & _T_61; // @[InterruptController.scala 42:46:@891.4]
  assign _T_64 = readBusy == 1'h0; // @[InterruptController.scala 43:33:@893.4]
  assign _T_65 = readBusyOld & _T_64; // @[InterruptController.scala 43:30:@894.4]
  assign _T_66 = mask[1]; // @[InterruptController.scala 43:50:@895.4]
  assign _T_67 = _T_65 & _T_66; // @[InterruptController.scala 43:43:@896.4]
  assign irq = {readBusyIrq,writeBusyIrq}; // @[Cat.scala 30:58:@898.4]
  assign isr = SetCSRAXIS_WB_AXI_io_value; // @[:@909.4 :@910.4]
  assign io_irq_readerDone = isr[1]; // @[InterruptController.scala 50:21:@914.4]
  assign io_irq_writerDone = isr[0]; // @[InterruptController.scala 49:21:@912.4]
  assign io_imr_dataIn = SimpleCSRAXIS_WB_AXI_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@872.4]
  assign io_isr_dataIn = SetCSRAXIS_WB_AXI_io_csr_dataIn; // @[SetCSR.scala 47:16:@905.4]
  assign SimpleCSRAXIS_WB_AXI_clock = clock; // @[:@870.4]
  assign SimpleCSRAXIS_WB_AXI_reset = reset; // @[:@871.4]
  assign SimpleCSRAXIS_WB_AXI_io_csr_dataOut = io_imr_dataOut; // @[SimpleCSR.scala 42:16:@874.4]
  assign SimpleCSRAXIS_WB_AXI_io_csr_dataWrite = io_imr_dataWrite; // @[SimpleCSR.scala 42:16:@873.4]
  assign SetCSRAXIS_WB_AXI_clock = clock; // @[:@902.4]
  assign SetCSRAXIS_WB_AXI_reset = reset; // @[:@903.4]
  assign SetCSRAXIS_WB_AXI_io_csr_dataOut = io_isr_dataOut; // @[SetCSR.scala 47:16:@907.4]
  assign SetCSRAXIS_WB_AXI_io_csr_dataWrite = io_isr_dataWrite; // @[SetCSR.scala 47:16:@906.4]
  assign SetCSRAXIS_WB_AXI_io_set = {{30'd0}, irq}; // @[SetCSR.scala 45:16:@904.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  readBusy = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readBusyOld = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeBusy = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writeBusyOld = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writeBusyIrq = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readBusyIrq = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    readBusy <= io_readBusy;
    readBusyOld <= readBusy;
    writeBusy <= io_writeBusy;
    writeBusyOld <= writeBusy;
    if (reset) begin
      writeBusyIrq <= 1'h0;
    end else begin
      writeBusyIrq <= _T_62;
    end
    if (reset) begin
      readBusyIrq <= 1'h0;
    end else begin
      readBusyIrq <= _T_67;
    end
  end
endmodule
module WorkerCSRWrapperAXIS_WB_AXI( // @[:@1054.2]
  input         clock, // @[:@1055.4]
  input         reset, // @[:@1056.4]
  input  [31:0] io_csr_0_dataOut, // @[:@1057.4]
  input         io_csr_0_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_0_dataIn, // @[:@1057.4]
  output [31:0] io_csr_1_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_2_dataOut, // @[:@1057.4]
  input         io_csr_2_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_2_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_3_dataOut, // @[:@1057.4]
  input         io_csr_3_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_3_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_4_dataOut, // @[:@1057.4]
  input         io_csr_4_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_4_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_5_dataOut, // @[:@1057.4]
  input         io_csr_5_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_5_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_6_dataOut, // @[:@1057.4]
  input         io_csr_6_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_6_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_7_dataOut, // @[:@1057.4]
  input         io_csr_7_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_7_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_8_dataOut, // @[:@1057.4]
  input         io_csr_8_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_8_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_9_dataOut, // @[:@1057.4]
  input         io_csr_9_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_9_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_10_dataOut, // @[:@1057.4]
  input         io_csr_10_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_10_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_11_dataOut, // @[:@1057.4]
  input         io_csr_11_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_11_dataIn, // @[:@1057.4]
  output [31:0] io_csr_12_dataIn, // @[:@1057.4]
  output [31:0] io_csr_13_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_14_dataOut, // @[:@1057.4]
  input         io_csr_14_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_14_dataIn, // @[:@1057.4]
  input  [31:0] io_csr_15_dataOut, // @[:@1057.4]
  input         io_csr_15_dataWrite, // @[:@1057.4]
  output [31:0] io_csr_15_dataIn, // @[:@1057.4]
  output        io_irq_readerDone, // @[:@1057.4]
  output        io_irq_writerDone, // @[:@1057.4]
  input         io_sync_readerSync, // @[:@1057.4]
  input         io_sync_writerSync, // @[:@1057.4]
  input         io_xferRead_done, // @[:@1057.4]
  output [31:0] io_xferRead_length, // @[:@1057.4]
  output        io_xferRead_valid, // @[:@1057.4]
  input         io_xferWrite_done, // @[:@1057.4]
  output [31:0] io_xferWrite_address, // @[:@1057.4]
  output [31:0] io_xferWrite_length, // @[:@1057.4]
  output        io_xferWrite_valid // @[:@1057.4]
);
  wire  addressGeneratorRead_clock; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  addressGeneratorRead_reset; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  addressGeneratorRead_io_ctl_start; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  addressGeneratorRead_io_ctl_busy; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  addressGeneratorRead_io_xfer_done; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire [31:0] addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 33:36:@1059.4]
  wire  transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire [31:0] transferSplitterRead_io_xferIn_length; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire  transferSplitterRead_io_xferIn_valid; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire  transferSplitterRead_io_xferOut_done; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire [31:0] transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire  transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 34:36:@1062.4]
  wire  addressGeneratorWrite_clock; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  addressGeneratorWrite_reset; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  addressGeneratorWrite_io_ctl_start; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  addressGeneratorWrite_io_ctl_busy; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  addressGeneratorWrite_io_xfer_done; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire [31:0] addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 36:37:@1065.4]
  wire  transferSplitterWrite_clock; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  transferSplitterWrite_reset; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire [31:0] transferSplitterWrite_io_xferIn_address; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire [31:0] transferSplitterWrite_io_xferIn_length; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  transferSplitterWrite_io_xferIn_valid; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  transferSplitterWrite_io_xferOut_done; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire [31:0] transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire [31:0] transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 37:37:@1068.4]
  wire  ClearCSRAXIS_WB_AXI_clock; // @[ClearCSR.scala 42:21:@1088.4]
  wire  ClearCSRAXIS_WB_AXI_reset; // @[ClearCSR.scala 42:21:@1088.4]
  wire [31:0] ClearCSRAXIS_WB_AXI_io_csr_dataOut; // @[ClearCSR.scala 42:21:@1088.4]
  wire  ClearCSRAXIS_WB_AXI_io_csr_dataWrite; // @[ClearCSR.scala 42:21:@1088.4]
  wire [31:0] ClearCSRAXIS_WB_AXI_io_csr_dataIn; // @[ClearCSR.scala 42:21:@1088.4]
  wire [31:0] ClearCSRAXIS_WB_AXI_io_value; // @[ClearCSR.scala 42:21:@1088.4]
  wire [31:0] ClearCSRAXIS_WB_AXI_io_clear; // @[ClearCSR.scala 42:21:@1088.4]
  wire  StatusCSRAXIS_WB_AXI_clock; // @[StatusCSR.scala 34:21:@1097.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1097.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_io_value; // @[StatusCSR.scala 34:21:@1097.4]
  wire  InterruptControllerAXIS_WB_AXI_clock; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_reset; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_irq_readerDone; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_irq_writerDone; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_readBusy; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_writeBusy; // @[InterruptController.scala 55:22:@1105.4]
  wire [31:0] InterruptControllerAXIS_WB_AXI_io_imr_dataOut; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_imr_dataWrite; // @[InterruptController.scala 55:22:@1105.4]
  wire [31:0] InterruptControllerAXIS_WB_AXI_io_imr_dataIn; // @[InterruptController.scala 55:22:@1105.4]
  wire [31:0] InterruptControllerAXIS_WB_AXI_io_isr_dataOut; // @[InterruptController.scala 55:22:@1105.4]
  wire  InterruptControllerAXIS_WB_AXI_io_isr_dataWrite; // @[InterruptController.scala 55:22:@1105.4]
  wire [31:0] InterruptControllerAXIS_WB_AXI_io_isr_dataIn; // @[InterruptController.scala 55:22:@1105.4]
  wire  SimpleCSRAXIS_WB_AXI_clock; // @[SimpleCSR.scala 40:21:@1142.4]
  wire  SimpleCSRAXIS_WB_AXI_reset; // @[SimpleCSR.scala 40:21:@1142.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1142.4]
  wire  SimpleCSRAXIS_WB_AXI_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1142.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1142.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_io_value; // @[SimpleCSR.scala 40:21:@1142.4]
  wire  SimpleCSRAXIS_WB_AXI_1_clock; // @[SimpleCSR.scala 40:21:@1150.4]
  wire  SimpleCSRAXIS_WB_AXI_1_reset; // @[SimpleCSR.scala 40:21:@1150.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_1_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1150.4]
  wire  SimpleCSRAXIS_WB_AXI_1_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1150.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_1_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1150.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_1_io_value; // @[SimpleCSR.scala 40:21:@1150.4]
  wire  SimpleCSRAXIS_WB_AXI_2_clock; // @[SimpleCSR.scala 40:21:@1158.4]
  wire  SimpleCSRAXIS_WB_AXI_2_reset; // @[SimpleCSR.scala 40:21:@1158.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_2_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1158.4]
  wire  SimpleCSRAXIS_WB_AXI_2_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1158.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_2_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1158.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_2_io_value; // @[SimpleCSR.scala 40:21:@1158.4]
  wire  SimpleCSRAXIS_WB_AXI_3_clock; // @[SimpleCSR.scala 40:21:@1166.4]
  wire  SimpleCSRAXIS_WB_AXI_3_reset; // @[SimpleCSR.scala 40:21:@1166.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_3_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1166.4]
  wire  SimpleCSRAXIS_WB_AXI_3_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1166.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_3_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1166.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_3_io_value; // @[SimpleCSR.scala 40:21:@1166.4]
  wire  SimpleCSRAXIS_WB_AXI_4_clock; // @[SimpleCSR.scala 40:21:@1175.4]
  wire  SimpleCSRAXIS_WB_AXI_4_reset; // @[SimpleCSR.scala 40:21:@1175.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_4_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1175.4]
  wire  SimpleCSRAXIS_WB_AXI_4_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1175.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_4_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1175.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_4_io_value; // @[SimpleCSR.scala 40:21:@1175.4]
  wire  SimpleCSRAXIS_WB_AXI_5_clock; // @[SimpleCSR.scala 40:21:@1183.4]
  wire  SimpleCSRAXIS_WB_AXI_5_reset; // @[SimpleCSR.scala 40:21:@1183.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_5_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1183.4]
  wire  SimpleCSRAXIS_WB_AXI_5_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1183.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_5_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1183.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_5_io_value; // @[SimpleCSR.scala 40:21:@1183.4]
  wire  SimpleCSRAXIS_WB_AXI_6_clock; // @[SimpleCSR.scala 40:21:@1191.4]
  wire  SimpleCSRAXIS_WB_AXI_6_reset; // @[SimpleCSR.scala 40:21:@1191.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_6_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1191.4]
  wire  SimpleCSRAXIS_WB_AXI_6_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1191.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_6_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1191.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_6_io_value; // @[SimpleCSR.scala 40:21:@1191.4]
  wire  SimpleCSRAXIS_WB_AXI_7_clock; // @[SimpleCSR.scala 40:21:@1199.4]
  wire  SimpleCSRAXIS_WB_AXI_7_reset; // @[SimpleCSR.scala 40:21:@1199.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_7_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1199.4]
  wire  SimpleCSRAXIS_WB_AXI_7_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1199.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_7_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1199.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_7_io_value; // @[SimpleCSR.scala 40:21:@1199.4]
  wire  StatusCSRAXIS_WB_AXI_1_clock; // @[StatusCSR.scala 34:21:@1207.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_1_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1207.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_1_io_value; // @[StatusCSR.scala 34:21:@1207.4]
  wire  StatusCSRAXIS_WB_AXI_2_clock; // @[StatusCSR.scala 34:21:@1215.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_2_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1215.4]
  wire [31:0] StatusCSRAXIS_WB_AXI_2_io_value; // @[StatusCSR.scala 34:21:@1215.4]
  wire  SimpleCSRAXIS_WB_AXI_8_clock; // @[SimpleCSR.scala 40:21:@1223.4]
  wire  SimpleCSRAXIS_WB_AXI_8_reset; // @[SimpleCSR.scala 40:21:@1223.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_8_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1223.4]
  wire  SimpleCSRAXIS_WB_AXI_8_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1223.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_8_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1223.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_8_io_value; // @[SimpleCSR.scala 40:21:@1223.4]
  wire  SimpleCSRAXIS_WB_AXI_9_clock; // @[SimpleCSR.scala 40:21:@1230.4]
  wire  SimpleCSRAXIS_WB_AXI_9_reset; // @[SimpleCSR.scala 40:21:@1230.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_9_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1230.4]
  wire  SimpleCSRAXIS_WB_AXI_9_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1230.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_9_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1230.4]
  wire [31:0] SimpleCSRAXIS_WB_AXI_9_io_value; // @[SimpleCSR.scala 40:21:@1230.4]
  reg [1:0] status; // @[WorkerCSRWrapper.scala 39:23:@1072.4]
  reg [31:0] _RAND_0;
  reg  readerSync; // @[WorkerCSRWrapper.scala 41:27:@1074.4]
  reg [31:0] _RAND_1;
  reg  readerSyncOld; // @[WorkerCSRWrapper.scala 42:30:@1076.4]
  reg [31:0] _RAND_2;
  reg  writerSync; // @[WorkerCSRWrapper.scala 44:27:@1078.4]
  reg [31:0] _RAND_3;
  reg  writerSyncOld; // @[WorkerCSRWrapper.scala 45:30:@1080.4]
  reg [31:0] _RAND_4;
  reg  readerStart; // @[WorkerCSRWrapper.scala 47:28:@1082.4]
  reg [31:0] _RAND_5;
  reg  writerStart; // @[WorkerCSRWrapper.scala 48:28:@1083.4]
  reg [31:0] _RAND_6;
  wire [1:0] _T_207; // @[Cat.scala 30:58:@1120.4]
  wire [31:0] control; // @[WorkerCSRWrapper.scala 50:21:@1084.4 WorkerCSRWrapper.scala 59:11:@1096.4]
  wire  _T_208; // @[WorkerCSRWrapper.scala 66:56:@1121.4]
  wire  _T_209; // @[WorkerCSRWrapper.scala 66:68:@1122.4]
  wire [1:0] _T_210; // @[Cat.scala 30:58:@1123.4]
  wire [1:0] _T_211; // @[WorkerCSRWrapper.scala 66:44:@1124.4]
  wire [1:0] clear; // @[WorkerCSRWrapper.scala 66:42:@1125.4]
  wire  _T_214; // @[WorkerCSRWrapper.scala 68:20:@1127.4]
  wire  _T_215; // @[WorkerCSRWrapper.scala 68:35:@1128.4]
  wire  _T_216; // @[WorkerCSRWrapper.scala 68:60:@1129.4]
  wire  _T_217; // @[WorkerCSRWrapper.scala 68:50:@1130.4]
  wire  _T_218; // @[WorkerCSRWrapper.scala 68:75:@1131.4]
  wire  _T_219; // @[WorkerCSRWrapper.scala 68:65:@1132.4]
  wire  _T_221; // @[WorkerCSRWrapper.scala 69:20:@1134.4]
  wire  _T_222; // @[WorkerCSRWrapper.scala 69:35:@1135.4]
  wire  _T_223; // @[WorkerCSRWrapper.scala 69:60:@1136.4]
  wire  _T_224; // @[WorkerCSRWrapper.scala 69:50:@1137.4]
  wire  _T_225; // @[WorkerCSRWrapper.scala 69:75:@1138.4]
  wire  _T_226; // @[WorkerCSRWrapper.scala 69:65:@1139.4]
  AddressGeneratorAXIS_WB_AXI addressGeneratorRead ( // @[WorkerCSRWrapper.scala 33:36:@1059.4]
    .clock(addressGeneratorRead_clock),
    .reset(addressGeneratorRead_reset),
    .io_ctl_start(addressGeneratorRead_io_ctl_start),
    .io_ctl_busy(addressGeneratorRead_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorRead_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorRead_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorRead_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorRead_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorRead_io_xfer_done),
    .io_xfer_address(addressGeneratorRead_io_xfer_address),
    .io_xfer_length(addressGeneratorRead_io_xfer_length),
    .io_xfer_valid(addressGeneratorRead_io_xfer_valid)
  );
  TransferSplitterAXIS_WB_AXI transferSplitterRead ( // @[WorkerCSRWrapper.scala 34:36:@1062.4]
    .io_xferIn_done(transferSplitterRead_io_xferIn_done),
    .io_xferIn_length(transferSplitterRead_io_xferIn_length),
    .io_xferIn_valid(transferSplitterRead_io_xferIn_valid),
    .io_xferOut_done(transferSplitterRead_io_xferOut_done),
    .io_xferOut_length(transferSplitterRead_io_xferOut_length),
    .io_xferOut_valid(transferSplitterRead_io_xferOut_valid)
  );
  AddressGeneratorAXIS_WB_AXI addressGeneratorWrite ( // @[WorkerCSRWrapper.scala 36:37:@1065.4]
    .clock(addressGeneratorWrite_clock),
    .reset(addressGeneratorWrite_reset),
    .io_ctl_start(addressGeneratorWrite_io_ctl_start),
    .io_ctl_busy(addressGeneratorWrite_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorWrite_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorWrite_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorWrite_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorWrite_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorWrite_io_xfer_done),
    .io_xfer_address(addressGeneratorWrite_io_xfer_address),
    .io_xfer_length(addressGeneratorWrite_io_xfer_length),
    .io_xfer_valid(addressGeneratorWrite_io_xfer_valid)
  );
  TransferSplitterAXIS_WB_AXI_1 transferSplitterWrite ( // @[WorkerCSRWrapper.scala 37:37:@1068.4]
    .clock(transferSplitterWrite_clock),
    .reset(transferSplitterWrite_reset),
    .io_xferIn_done(transferSplitterWrite_io_xferIn_done),
    .io_xferIn_address(transferSplitterWrite_io_xferIn_address),
    .io_xferIn_length(transferSplitterWrite_io_xferIn_length),
    .io_xferIn_valid(transferSplitterWrite_io_xferIn_valid),
    .io_xferOut_done(transferSplitterWrite_io_xferOut_done),
    .io_xferOut_address(transferSplitterWrite_io_xferOut_address),
    .io_xferOut_length(transferSplitterWrite_io_xferOut_length),
    .io_xferOut_valid(transferSplitterWrite_io_xferOut_valid)
  );
  ClearCSRAXIS_WB_AXI ClearCSRAXIS_WB_AXI ( // @[ClearCSR.scala 42:21:@1088.4]
    .clock(ClearCSRAXIS_WB_AXI_clock),
    .reset(ClearCSRAXIS_WB_AXI_reset),
    .io_csr_dataOut(ClearCSRAXIS_WB_AXI_io_csr_dataOut),
    .io_csr_dataWrite(ClearCSRAXIS_WB_AXI_io_csr_dataWrite),
    .io_csr_dataIn(ClearCSRAXIS_WB_AXI_io_csr_dataIn),
    .io_value(ClearCSRAXIS_WB_AXI_io_value),
    .io_clear(ClearCSRAXIS_WB_AXI_io_clear)
  );
  StatusCSRAXIS_WB_AXI StatusCSRAXIS_WB_AXI ( // @[StatusCSR.scala 34:21:@1097.4]
    .clock(StatusCSRAXIS_WB_AXI_clock),
    .io_csr_dataIn(StatusCSRAXIS_WB_AXI_io_csr_dataIn),
    .io_value(StatusCSRAXIS_WB_AXI_io_value)
  );
  InterruptControllerAXIS_WB_AXI InterruptControllerAXIS_WB_AXI ( // @[InterruptController.scala 55:22:@1105.4]
    .clock(InterruptControllerAXIS_WB_AXI_clock),
    .reset(InterruptControllerAXIS_WB_AXI_reset),
    .io_irq_readerDone(InterruptControllerAXIS_WB_AXI_io_irq_readerDone),
    .io_irq_writerDone(InterruptControllerAXIS_WB_AXI_io_irq_writerDone),
    .io_readBusy(InterruptControllerAXIS_WB_AXI_io_readBusy),
    .io_writeBusy(InterruptControllerAXIS_WB_AXI_io_writeBusy),
    .io_imr_dataOut(InterruptControllerAXIS_WB_AXI_io_imr_dataOut),
    .io_imr_dataWrite(InterruptControllerAXIS_WB_AXI_io_imr_dataWrite),
    .io_imr_dataIn(InterruptControllerAXIS_WB_AXI_io_imr_dataIn),
    .io_isr_dataOut(InterruptControllerAXIS_WB_AXI_io_isr_dataOut),
    .io_isr_dataWrite(InterruptControllerAXIS_WB_AXI_io_isr_dataWrite),
    .io_isr_dataIn(InterruptControllerAXIS_WB_AXI_io_isr_dataIn)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI ( // @[SimpleCSR.scala 40:21:@1142.4]
    .clock(SimpleCSRAXIS_WB_AXI_clock),
    .reset(SimpleCSRAXIS_WB_AXI_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_1 ( // @[SimpleCSR.scala 40:21:@1150.4]
    .clock(SimpleCSRAXIS_WB_AXI_1_clock),
    .reset(SimpleCSRAXIS_WB_AXI_1_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_1_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_1_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_1_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_1_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_2 ( // @[SimpleCSR.scala 40:21:@1158.4]
    .clock(SimpleCSRAXIS_WB_AXI_2_clock),
    .reset(SimpleCSRAXIS_WB_AXI_2_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_2_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_2_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_2_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_2_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_3 ( // @[SimpleCSR.scala 40:21:@1166.4]
    .clock(SimpleCSRAXIS_WB_AXI_3_clock),
    .reset(SimpleCSRAXIS_WB_AXI_3_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_3_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_3_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_3_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_3_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_4 ( // @[SimpleCSR.scala 40:21:@1175.4]
    .clock(SimpleCSRAXIS_WB_AXI_4_clock),
    .reset(SimpleCSRAXIS_WB_AXI_4_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_4_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_4_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_4_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_4_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_5 ( // @[SimpleCSR.scala 40:21:@1183.4]
    .clock(SimpleCSRAXIS_WB_AXI_5_clock),
    .reset(SimpleCSRAXIS_WB_AXI_5_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_5_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_5_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_5_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_5_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_6 ( // @[SimpleCSR.scala 40:21:@1191.4]
    .clock(SimpleCSRAXIS_WB_AXI_6_clock),
    .reset(SimpleCSRAXIS_WB_AXI_6_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_6_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_6_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_6_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_6_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_7 ( // @[SimpleCSR.scala 40:21:@1199.4]
    .clock(SimpleCSRAXIS_WB_AXI_7_clock),
    .reset(SimpleCSRAXIS_WB_AXI_7_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_7_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_7_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_7_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_7_io_value)
  );
  StatusCSRAXIS_WB_AXI StatusCSRAXIS_WB_AXI_1 ( // @[StatusCSR.scala 34:21:@1207.4]
    .clock(StatusCSRAXIS_WB_AXI_1_clock),
    .io_csr_dataIn(StatusCSRAXIS_WB_AXI_1_io_csr_dataIn),
    .io_value(StatusCSRAXIS_WB_AXI_1_io_value)
  );
  StatusCSRAXIS_WB_AXI StatusCSRAXIS_WB_AXI_2 ( // @[StatusCSR.scala 34:21:@1215.4]
    .clock(StatusCSRAXIS_WB_AXI_2_clock),
    .io_csr_dataIn(StatusCSRAXIS_WB_AXI_2_io_csr_dataIn),
    .io_value(StatusCSRAXIS_WB_AXI_2_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_8 ( // @[SimpleCSR.scala 40:21:@1223.4]
    .clock(SimpleCSRAXIS_WB_AXI_8_clock),
    .reset(SimpleCSRAXIS_WB_AXI_8_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_8_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_8_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_8_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_8_io_value)
  );
  SimpleCSRAXIS_WB_AXI SimpleCSRAXIS_WB_AXI_9 ( // @[SimpleCSR.scala 40:21:@1230.4]
    .clock(SimpleCSRAXIS_WB_AXI_9_clock),
    .reset(SimpleCSRAXIS_WB_AXI_9_reset),
    .io_csr_dataOut(SimpleCSRAXIS_WB_AXI_9_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXIS_WB_AXI_9_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXIS_WB_AXI_9_io_csr_dataIn),
    .io_value(SimpleCSRAXIS_WB_AXI_9_io_value)
  );
  assign _T_207 = {readerStart,writerStart}; // @[Cat.scala 30:58:@1120.4]
  assign control = ClearCSRAXIS_WB_AXI_io_value; // @[WorkerCSRWrapper.scala 50:21:@1084.4 WorkerCSRWrapper.scala 59:11:@1096.4]
  assign _T_208 = control[5]; // @[WorkerCSRWrapper.scala 66:56:@1121.4]
  assign _T_209 = control[4]; // @[WorkerCSRWrapper.scala 66:68:@1122.4]
  assign _T_210 = {_T_208,_T_209}; // @[Cat.scala 30:58:@1123.4]
  assign _T_211 = ~ _T_210; // @[WorkerCSRWrapper.scala 66:44:@1124.4]
  assign clear = _T_207 & _T_211; // @[WorkerCSRWrapper.scala 66:42:@1125.4]
  assign _T_214 = readerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 68:20:@1127.4]
  assign _T_215 = _T_214 & readerSync; // @[WorkerCSRWrapper.scala 68:35:@1128.4]
  assign _T_216 = control[3]; // @[WorkerCSRWrapper.scala 68:60:@1129.4]
  assign _T_217 = _T_215 | _T_216; // @[WorkerCSRWrapper.scala 68:50:@1130.4]
  assign _T_218 = control[1]; // @[WorkerCSRWrapper.scala 68:75:@1131.4]
  assign _T_219 = _T_217 & _T_218; // @[WorkerCSRWrapper.scala 68:65:@1132.4]
  assign _T_221 = writerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 69:20:@1134.4]
  assign _T_222 = _T_221 & writerSync; // @[WorkerCSRWrapper.scala 69:35:@1135.4]
  assign _T_223 = control[2]; // @[WorkerCSRWrapper.scala 69:60:@1136.4]
  assign _T_224 = _T_222 | _T_223; // @[WorkerCSRWrapper.scala 69:50:@1137.4]
  assign _T_225 = control[0]; // @[WorkerCSRWrapper.scala 69:75:@1138.4]
  assign _T_226 = _T_224 & _T_225; // @[WorkerCSRWrapper.scala 69:65:@1139.4]
  assign io_csr_0_dataIn = ClearCSRAXIS_WB_AXI_io_csr_dataIn; // @[ClearCSR.scala 46:16:@1092.4]
  assign io_csr_1_dataIn = StatusCSRAXIS_WB_AXI_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1100.4]
  assign io_csr_2_dataIn = InterruptControllerAXIS_WB_AXI_io_imr_dataIn; // @[InterruptController.scala 60:17:@1110.4]
  assign io_csr_3_dataIn = InterruptControllerAXIS_WB_AXI_io_isr_dataIn; // @[InterruptController.scala 61:17:@1114.4]
  assign io_csr_4_dataIn = SimpleCSRAXIS_WB_AXI_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1145.4]
  assign io_csr_5_dataIn = SimpleCSRAXIS_WB_AXI_1_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1153.4]
  assign io_csr_6_dataIn = SimpleCSRAXIS_WB_AXI_2_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1161.4]
  assign io_csr_7_dataIn = SimpleCSRAXIS_WB_AXI_3_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1169.4]
  assign io_csr_8_dataIn = SimpleCSRAXIS_WB_AXI_4_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1178.4]
  assign io_csr_9_dataIn = SimpleCSRAXIS_WB_AXI_5_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1186.4]
  assign io_csr_10_dataIn = SimpleCSRAXIS_WB_AXI_6_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1194.4]
  assign io_csr_11_dataIn = SimpleCSRAXIS_WB_AXI_7_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1202.4]
  assign io_csr_12_dataIn = StatusCSRAXIS_WB_AXI_1_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1210.4]
  assign io_csr_13_dataIn = StatusCSRAXIS_WB_AXI_2_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1218.4]
  assign io_csr_14_dataIn = SimpleCSRAXIS_WB_AXI_8_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1226.4]
  assign io_csr_15_dataIn = SimpleCSRAXIS_WB_AXI_9_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1233.4]
  assign io_irq_readerDone = InterruptControllerAXIS_WB_AXI_io_irq_readerDone; // @[WorkerCSRWrapper.scala 63:10:@1119.4]
  assign io_irq_writerDone = InterruptControllerAXIS_WB_AXI_io_irq_writerDone; // @[WorkerCSRWrapper.scala 63:10:@1118.4]
  assign io_xferRead_length = transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 91:15:@1244.4]
  assign io_xferRead_valid = transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 91:15:@1243.4]
  assign io_xferWrite_address = transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 94:16:@1255.4]
  assign io_xferWrite_length = transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 94:16:@1254.4]
  assign io_xferWrite_valid = transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 94:16:@1253.4]
  assign addressGeneratorRead_clock = clock; // @[:@1060.4]
  assign addressGeneratorRead_reset = reset; // @[:@1061.4]
  assign addressGeneratorRead_io_ctl_start = readerStart; // @[WorkerCSRWrapper.scala 71:37:@1141.4]
  assign addressGeneratorRead_io_ctl_startAddress = SimpleCSRAXIS_WB_AXI_io_value; // @[WorkerCSRWrapper.scala 72:44:@1149.4]
  assign addressGeneratorRead_io_ctl_lineLength = SimpleCSRAXIS_WB_AXI_1_io_value; // @[WorkerCSRWrapper.scala 73:42:@1157.4]
  assign addressGeneratorRead_io_ctl_lineCount = SimpleCSRAXIS_WB_AXI_2_io_value; // @[WorkerCSRWrapper.scala 74:41:@1165.4]
  assign addressGeneratorRead_io_ctl_lineGap = SimpleCSRAXIS_WB_AXI_3_io_value; // @[WorkerCSRWrapper.scala 75:39:@1173.4]
  assign addressGeneratorRead_io_xfer_done = transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 90:34:@1241.4]
  assign transferSplitterRead_io_xferIn_length = addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 90:34:@1239.4]
  assign transferSplitterRead_io_xferIn_valid = addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 90:34:@1238.4]
  assign transferSplitterRead_io_xferOut_done = io_xferRead_done; // @[WorkerCSRWrapper.scala 91:15:@1246.4]
  assign addressGeneratorWrite_clock = clock; // @[:@1066.4]
  assign addressGeneratorWrite_reset = reset; // @[:@1067.4]
  assign addressGeneratorWrite_io_ctl_start = writerStart; // @[WorkerCSRWrapper.scala 77:38:@1174.4]
  assign addressGeneratorWrite_io_ctl_startAddress = SimpleCSRAXIS_WB_AXI_4_io_value; // @[WorkerCSRWrapper.scala 78:45:@1182.4]
  assign addressGeneratorWrite_io_ctl_lineLength = SimpleCSRAXIS_WB_AXI_5_io_value; // @[WorkerCSRWrapper.scala 79:43:@1190.4]
  assign addressGeneratorWrite_io_ctl_lineCount = SimpleCSRAXIS_WB_AXI_6_io_value; // @[WorkerCSRWrapper.scala 80:42:@1198.4]
  assign addressGeneratorWrite_io_ctl_lineGap = SimpleCSRAXIS_WB_AXI_7_io_value; // @[WorkerCSRWrapper.scala 81:40:@1206.4]
  assign addressGeneratorWrite_io_xfer_done = transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 93:35:@1251.4]
  assign transferSplitterWrite_clock = clock; // @[:@1069.4]
  assign transferSplitterWrite_reset = reset; // @[:@1070.4]
  assign transferSplitterWrite_io_xferIn_address = addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 93:35:@1250.4]
  assign transferSplitterWrite_io_xferIn_length = addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 93:35:@1249.4]
  assign transferSplitterWrite_io_xferIn_valid = addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 93:35:@1248.4]
  assign transferSplitterWrite_io_xferOut_done = io_xferWrite_done; // @[WorkerCSRWrapper.scala 94:16:@1256.4]
  assign ClearCSRAXIS_WB_AXI_clock = clock; // @[:@1089.4]
  assign ClearCSRAXIS_WB_AXI_reset = reset; // @[:@1090.4]
  assign ClearCSRAXIS_WB_AXI_io_csr_dataOut = io_csr_0_dataOut; // @[ClearCSR.scala 46:16:@1094.4]
  assign ClearCSRAXIS_WB_AXI_io_csr_dataWrite = io_csr_0_dataWrite; // @[ClearCSR.scala 46:16:@1093.4]
  assign ClearCSRAXIS_WB_AXI_io_clear = {{30'd0}, clear}; // @[ClearCSR.scala 44:18:@1091.4]
  assign StatusCSRAXIS_WB_AXI_clock = clock; // @[:@1098.4]
  assign StatusCSRAXIS_WB_AXI_io_value = {{30'd0}, status}; // @[StatusCSR.scala 38:18:@1104.4]
  assign InterruptControllerAXIS_WB_AXI_clock = clock; // @[:@1106.4]
  assign InterruptControllerAXIS_WB_AXI_reset = reset; // @[:@1107.4]
  assign InterruptControllerAXIS_WB_AXI_io_readBusy = addressGeneratorRead_io_ctl_busy; // @[InterruptController.scala 57:22:@1108.4]
  assign InterruptControllerAXIS_WB_AXI_io_writeBusy = addressGeneratorWrite_io_ctl_busy; // @[InterruptController.scala 58:23:@1109.4]
  assign InterruptControllerAXIS_WB_AXI_io_imr_dataOut = io_csr_2_dataOut; // @[InterruptController.scala 60:17:@1112.4]
  assign InterruptControllerAXIS_WB_AXI_io_imr_dataWrite = io_csr_2_dataWrite; // @[InterruptController.scala 60:17:@1111.4]
  assign InterruptControllerAXIS_WB_AXI_io_isr_dataOut = io_csr_3_dataOut; // @[InterruptController.scala 61:17:@1116.4]
  assign InterruptControllerAXIS_WB_AXI_io_isr_dataWrite = io_csr_3_dataWrite; // @[InterruptController.scala 61:17:@1115.4]
  assign SimpleCSRAXIS_WB_AXI_clock = clock; // @[:@1143.4]
  assign SimpleCSRAXIS_WB_AXI_reset = reset; // @[:@1144.4]
  assign SimpleCSRAXIS_WB_AXI_io_csr_dataOut = io_csr_4_dataOut; // @[SimpleCSR.scala 42:16:@1147.4]
  assign SimpleCSRAXIS_WB_AXI_io_csr_dataWrite = io_csr_4_dataWrite; // @[SimpleCSR.scala 42:16:@1146.4]
  assign SimpleCSRAXIS_WB_AXI_1_clock = clock; // @[:@1151.4]
  assign SimpleCSRAXIS_WB_AXI_1_reset = reset; // @[:@1152.4]
  assign SimpleCSRAXIS_WB_AXI_1_io_csr_dataOut = io_csr_5_dataOut; // @[SimpleCSR.scala 42:16:@1155.4]
  assign SimpleCSRAXIS_WB_AXI_1_io_csr_dataWrite = io_csr_5_dataWrite; // @[SimpleCSR.scala 42:16:@1154.4]
  assign SimpleCSRAXIS_WB_AXI_2_clock = clock; // @[:@1159.4]
  assign SimpleCSRAXIS_WB_AXI_2_reset = reset; // @[:@1160.4]
  assign SimpleCSRAXIS_WB_AXI_2_io_csr_dataOut = io_csr_6_dataOut; // @[SimpleCSR.scala 42:16:@1163.4]
  assign SimpleCSRAXIS_WB_AXI_2_io_csr_dataWrite = io_csr_6_dataWrite; // @[SimpleCSR.scala 42:16:@1162.4]
  assign SimpleCSRAXIS_WB_AXI_3_clock = clock; // @[:@1167.4]
  assign SimpleCSRAXIS_WB_AXI_3_reset = reset; // @[:@1168.4]
  assign SimpleCSRAXIS_WB_AXI_3_io_csr_dataOut = io_csr_7_dataOut; // @[SimpleCSR.scala 42:16:@1171.4]
  assign SimpleCSRAXIS_WB_AXI_3_io_csr_dataWrite = io_csr_7_dataWrite; // @[SimpleCSR.scala 42:16:@1170.4]
  assign SimpleCSRAXIS_WB_AXI_4_clock = clock; // @[:@1176.4]
  assign SimpleCSRAXIS_WB_AXI_4_reset = reset; // @[:@1177.4]
  assign SimpleCSRAXIS_WB_AXI_4_io_csr_dataOut = io_csr_8_dataOut; // @[SimpleCSR.scala 42:16:@1180.4]
  assign SimpleCSRAXIS_WB_AXI_4_io_csr_dataWrite = io_csr_8_dataWrite; // @[SimpleCSR.scala 42:16:@1179.4]
  assign SimpleCSRAXIS_WB_AXI_5_clock = clock; // @[:@1184.4]
  assign SimpleCSRAXIS_WB_AXI_5_reset = reset; // @[:@1185.4]
  assign SimpleCSRAXIS_WB_AXI_5_io_csr_dataOut = io_csr_9_dataOut; // @[SimpleCSR.scala 42:16:@1188.4]
  assign SimpleCSRAXIS_WB_AXI_5_io_csr_dataWrite = io_csr_9_dataWrite; // @[SimpleCSR.scala 42:16:@1187.4]
  assign SimpleCSRAXIS_WB_AXI_6_clock = clock; // @[:@1192.4]
  assign SimpleCSRAXIS_WB_AXI_6_reset = reset; // @[:@1193.4]
  assign SimpleCSRAXIS_WB_AXI_6_io_csr_dataOut = io_csr_10_dataOut; // @[SimpleCSR.scala 42:16:@1196.4]
  assign SimpleCSRAXIS_WB_AXI_6_io_csr_dataWrite = io_csr_10_dataWrite; // @[SimpleCSR.scala 42:16:@1195.4]
  assign SimpleCSRAXIS_WB_AXI_7_clock = clock; // @[:@1200.4]
  assign SimpleCSRAXIS_WB_AXI_7_reset = reset; // @[:@1201.4]
  assign SimpleCSRAXIS_WB_AXI_7_io_csr_dataOut = io_csr_11_dataOut; // @[SimpleCSR.scala 42:16:@1204.4]
  assign SimpleCSRAXIS_WB_AXI_7_io_csr_dataWrite = io_csr_11_dataWrite; // @[SimpleCSR.scala 42:16:@1203.4]
  assign StatusCSRAXIS_WB_AXI_1_clock = clock; // @[:@1208.4]
  assign StatusCSRAXIS_WB_AXI_1_io_value = 32'h0; // @[StatusCSR.scala 38:18:@1214.4]
  assign StatusCSRAXIS_WB_AXI_2_clock = clock; // @[:@1216.4]
  assign StatusCSRAXIS_WB_AXI_2_io_value = 32'h230; // @[StatusCSR.scala 38:18:@1222.4]
  assign SimpleCSRAXIS_WB_AXI_8_clock = clock; // @[:@1224.4]
  assign SimpleCSRAXIS_WB_AXI_8_reset = reset; // @[:@1225.4]
  assign SimpleCSRAXIS_WB_AXI_8_io_csr_dataOut = io_csr_14_dataOut; // @[SimpleCSR.scala 42:16:@1228.4]
  assign SimpleCSRAXIS_WB_AXI_8_io_csr_dataWrite = io_csr_14_dataWrite; // @[SimpleCSR.scala 42:16:@1227.4]
  assign SimpleCSRAXIS_WB_AXI_9_clock = clock; // @[:@1231.4]
  assign SimpleCSRAXIS_WB_AXI_9_reset = reset; // @[:@1232.4]
  assign SimpleCSRAXIS_WB_AXI_9_io_csr_dataOut = io_csr_15_dataOut; // @[SimpleCSR.scala 42:16:@1235.4]
  assign SimpleCSRAXIS_WB_AXI_9_io_csr_dataWrite = io_csr_15_dataWrite; // @[SimpleCSR.scala 42:16:@1234.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readerSync = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  readerSyncOld = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writerSync = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writerSyncOld = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readerStart = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  writerStart = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    status <= {addressGeneratorRead_io_ctl_busy,addressGeneratorWrite_io_ctl_busy};
    readerSync <= io_sync_readerSync;
    readerSyncOld <= readerSync;
    writerSync <= io_sync_writerSync;
    writerSyncOld <= writerSync;
    if (reset) begin
      readerStart <= 1'h0;
    end else begin
      readerStart <= _T_219;
    end
    if (reset) begin
      writerStart <= 1'h0;
    end else begin
      writerStart <= _T_226;
    end
  end
endmodule
module Queue( // @[:@1258.2]
  input         clock, // @[:@1259.4]
  input         reset, // @[:@1260.4]
  output        io_enq_ready, // @[:@1261.4]
  input         io_enq_valid, // @[:@1261.4]
  input  [31:0] io_enq_bits, // @[:@1261.4]
  input         io_deq_ready, // @[:@1261.4]
  output        io_deq_valid, // @[:@1261.4]
  output [31:0] io_deq_bits // @[:@1261.4]
);
  reg [31:0] ram [0:511]; // @[Decoupled.scala 215:24:@1263.4]
  reg [31:0] _RAND_0;
  wire [31:0] ram__T_63_data; // @[Decoupled.scala 215:24:@1263.4]
  wire [8:0] ram__T_63_addr; // @[Decoupled.scala 215:24:@1263.4]
  wire [31:0] ram__T_49_data; // @[Decoupled.scala 215:24:@1263.4]
  wire [8:0] ram__T_49_addr; // @[Decoupled.scala 215:24:@1263.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 215:24:@1263.4]
  wire  ram__T_49_en; // @[Decoupled.scala 215:24:@1263.4]
  reg [8:0] value; // @[Counter.scala 26:33:@1264.4]
  reg [31:0] _RAND_1;
  reg [8:0] value_1; // @[Counter.scala 26:33:@1265.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 218:35:@1266.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 220:41:@1267.4]
  wire  _T_43; // @[Decoupled.scala 221:36:@1268.4]
  wire  empty; // @[Decoupled.scala 221:33:@1269.4]
  wire  _T_44; // @[Decoupled.scala 222:32:@1270.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@1271.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@1274.4]
  wire [9:0] _T_52; // @[Counter.scala 35:22:@1281.6]
  wire [8:0] _T_53; // @[Counter.scala 35:22:@1282.6]
  wire [8:0] _GEN_5; // @[Decoupled.scala 226:17:@1277.4]
  wire [9:0] _T_56; // @[Counter.scala 35:22:@1287.6]
  wire [8:0] _T_57; // @[Counter.scala 35:22:@1288.6]
  wire [8:0] _GEN_6; // @[Decoupled.scala 230:17:@1285.4]
  wire  _T_58; // @[Decoupled.scala 233:16:@1291.4]
  wire  _GEN_7; // @[Decoupled.scala 233:28:@1292.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 215:24:@1263.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 220:41:@1267.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 221:36:@1268.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 221:33:@1269.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 222:32:@1270.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@1271.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@1274.4]
  assign _T_52 = value + 9'h1; // @[Counter.scala 35:22:@1281.6]
  assign _T_53 = value + 9'h1; // @[Counter.scala 35:22:@1282.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 226:17:@1277.4]
  assign _T_56 = value_1 + 9'h1; // @[Counter.scala 35:22:@1287.6]
  assign _T_57 = value_1 + 9'h1; // @[Counter.scala 35:22:@1288.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 230:17:@1285.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 233:16:@1291.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 233:28:@1292.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 238:16:@1298.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 237:16:@1296.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 239:15:@1300.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_49_en & ram__T_49_mask) begin
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 215:24:@1263.4]
    end
    if (reset) begin
      value <= 9'h0;
    end else begin
      if (do_enq) begin
        value <= _T_53;
      end
    end
    if (reset) begin
      value_1 <= 9'h0;
    end else begin
      if (do_deq) begin
        value_1 <= _T_57;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_58) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module DMATopAXIS_WB_AXI( // @[:@1309.2]
  input         clock, // @[:@1310.4]
  input         reset, // @[:@1311.4]
  input  [31:0] io_control_dat_i, // @[:@1312.4]
  output [31:0] io_control_dat_o, // @[:@1312.4]
  input         io_control_cyc_i, // @[:@1312.4]
  input         io_control_stb_i, // @[:@1312.4]
  input         io_control_we_i, // @[:@1312.4]
  input  [29:0] io_control_adr_i, // @[:@1312.4]
  input  [3:0]  io_control_sel_i, // @[:@1312.4]
  output        io_control_ack_o, // @[:@1312.4]
  output        io_control_stall_o, // @[:@1312.4]
  output        io_control_err_o, // @[:@1312.4]
  input  [31:0] io_read_tdata, // @[:@1312.4]
  input         io_read_tvalid, // @[:@1312.4]
  output        io_read_tready, // @[:@1312.4]
  input         io_read_tuser, // @[:@1312.4]
  input         io_read_tlast, // @[:@1312.4]
  output [3:0]  io_write_aw_awid, // @[:@1312.4]
  output [31:0] io_write_aw_awaddr, // @[:@1312.4]
  output [7:0]  io_write_aw_awlen, // @[:@1312.4]
  output [2:0]  io_write_aw_awsize, // @[:@1312.4]
  output [1:0]  io_write_aw_awburst, // @[:@1312.4]
  output        io_write_aw_awlock, // @[:@1312.4]
  output [3:0]  io_write_aw_awcache, // @[:@1312.4]
  output [2:0]  io_write_aw_awprot, // @[:@1312.4]
  output [3:0]  io_write_aw_awqos, // @[:@1312.4]
  output        io_write_aw_awvalid, // @[:@1312.4]
  input         io_write_aw_awready, // @[:@1312.4]
  output [31:0] io_write_w_wdata, // @[:@1312.4]
  output [3:0]  io_write_w_wstrb, // @[:@1312.4]
  output        io_write_w_wlast, // @[:@1312.4]
  output        io_write_w_wvalid, // @[:@1312.4]
  input         io_write_w_wready, // @[:@1312.4]
  input  [3:0]  io_write_b_bid, // @[:@1312.4]
  input  [1:0]  io_write_b_bresp, // @[:@1312.4]
  input         io_write_b_bvalid, // @[:@1312.4]
  output        io_write_b_bready, // @[:@1312.4]
  output [3:0]  io_write_ar_arid, // @[:@1312.4]
  output [31:0] io_write_ar_araddr, // @[:@1312.4]
  output [7:0]  io_write_ar_arlen, // @[:@1312.4]
  output [2:0]  io_write_ar_arsize, // @[:@1312.4]
  output [1:0]  io_write_ar_arburst, // @[:@1312.4]
  output        io_write_ar_arlock, // @[:@1312.4]
  output [3:0]  io_write_ar_arcache, // @[:@1312.4]
  output [2:0]  io_write_ar_arprot, // @[:@1312.4]
  output [3:0]  io_write_ar_arqos, // @[:@1312.4]
  output        io_write_ar_arvalid, // @[:@1312.4]
  input         io_write_ar_arready, // @[:@1312.4]
  input  [3:0]  io_write_r_rid, // @[:@1312.4]
  input  [31:0] io_write_r_rdata, // @[:@1312.4]
  input  [1:0]  io_write_r_rresp, // @[:@1312.4]
  input         io_write_r_rlast, // @[:@1312.4]
  input         io_write_r_rvalid, // @[:@1312.4]
  output        io_write_r_rready, // @[:@1312.4]
  output        io_irq_readerDone, // @[:@1312.4]
  output        io_irq_writerDone, // @[:@1312.4]
  input         io_sync_readerSync, // @[:@1312.4]
  input         io_sync_writerSync // @[:@1312.4]
);
  wire  csrFrontend_clock; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_reset; // @[DMATop.scala 38:27:@1314.4]
  wire [31:0] csrFrontend_io_ctl_dat_i; // @[DMATop.scala 38:27:@1314.4]
  wire [31:0] csrFrontend_io_ctl_dat_o; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_ctl_cyc_i; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_ctl_stb_i; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_ctl_we_i; // @[DMATop.scala 38:27:@1314.4]
  wire [29:0] csrFrontend_io_ctl_adr_i; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_ctl_ack_o; // @[DMATop.scala 38:27:@1314.4]
  wire [3:0] csrFrontend_io_bus_addr; // @[DMATop.scala 38:27:@1314.4]
  wire [31:0] csrFrontend_io_bus_dataOut; // @[DMATop.scala 38:27:@1314.4]
  wire [31:0] csrFrontend_io_bus_dataIn; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_bus_write; // @[DMATop.scala 38:27:@1314.4]
  wire  csrFrontend_io_bus_read; // @[DMATop.scala 38:27:@1314.4]
  wire  readerFrontend_clock; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_reset; // @[DMATop.scala 40:30:@1317.4]
  wire [31:0] readerFrontend_io_bus_tdata; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_bus_tvalid; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_bus_tready; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_dataIO_ready; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_dataIO_valid; // @[DMATop.scala 40:30:@1317.4]
  wire [31:0] readerFrontend_io_dataIO_bits; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_xfer_done; // @[DMATop.scala 40:30:@1317.4]
  wire [31:0] readerFrontend_io_xfer_length; // @[DMATop.scala 40:30:@1317.4]
  wire  readerFrontend_io_xfer_valid; // @[DMATop.scala 40:30:@1317.4]
  wire  writerFrontend_clock; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_reset; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 42:30:@1320.4]
  wire [7:0] writerFrontend_io_bus_aw_awlen; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_aw_awready; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] writerFrontend_io_bus_w_wdata; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_w_wlast; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_w_wready; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_b_bvalid; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_bus_b_bready; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_dataIO_ready; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_dataIO_valid; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] writerFrontend_io_dataIO_bits; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_xfer_done; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] writerFrontend_io_xfer_address; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] writerFrontend_io_xfer_length; // @[DMATop.scala 42:30:@1320.4]
  wire  writerFrontend_io_xfer_valid; // @[DMATop.scala 42:30:@1320.4]
  wire [31:0] csr_io_csr_0_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_0_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_0_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_1_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_2_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_2_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_2_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_3_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_3_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_3_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_4_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_4_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_4_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_5_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_5_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_5_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_6_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_6_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_6_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_7_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_7_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_7_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_8_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_8_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_8_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_9_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_9_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_9_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_10_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_10_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_10_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_11_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_11_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_11_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_12_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_13_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_14_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_14_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_14_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_15_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_csr_15_dataWrite; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_csr_15_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire [3:0] csr_io_bus_addr; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_bus_dataOut; // @[DMATop.scala 44:19:@1323.4]
  wire [31:0] csr_io_bus_dataIn; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_bus_write; // @[DMATop.scala 44:19:@1323.4]
  wire  csr_io_bus_read; // @[DMATop.scala 44:19:@1323.4]
  wire  ctl_clock; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_reset; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_0_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_0_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_0_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_1_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_2_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_2_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_2_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_3_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_3_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_3_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_4_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_4_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_4_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_5_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_5_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_5_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_6_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_6_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_6_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_7_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_7_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_7_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_8_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_8_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_8_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_9_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_9_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_9_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_10_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_10_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_10_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_11_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_11_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_11_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_12_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_13_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_14_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_14_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_14_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_15_dataOut; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_csr_15_dataWrite; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_csr_15_dataIn; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_irq_readerDone; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_irq_writerDone; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_sync_readerSync; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_sync_writerSync; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_xferRead_done; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_xferRead_length; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_xferRead_valid; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_xferWrite_done; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_xferWrite_address; // @[DMATop.scala 46:19:@1326.4]
  wire [31:0] ctl_io_xferWrite_length; // @[DMATop.scala 46:19:@1326.4]
  wire  ctl_io_xferWrite_valid; // @[DMATop.scala 46:19:@1326.4]
  wire  queue_clock; // @[Decoupled.scala 294:21:@1329.4]
  wire  queue_reset; // @[Decoupled.scala 294:21:@1329.4]
  wire  queue_io_enq_ready; // @[Decoupled.scala 294:21:@1329.4]
  wire  queue_io_enq_valid; // @[Decoupled.scala 294:21:@1329.4]
  wire [31:0] queue_io_enq_bits; // @[Decoupled.scala 294:21:@1329.4]
  wire  queue_io_deq_ready; // @[Decoupled.scala 294:21:@1329.4]
  wire  queue_io_deq_valid; // @[Decoupled.scala 294:21:@1329.4]
  wire [31:0] queue_io_deq_bits; // @[Decoupled.scala 294:21:@1329.4]
  WishboneCSRAXIS_WB_AXI csrFrontend ( // @[DMATop.scala 38:27:@1314.4]
    .clock(csrFrontend_clock),
    .reset(csrFrontend_reset),
    .io_ctl_dat_i(csrFrontend_io_ctl_dat_i),
    .io_ctl_dat_o(csrFrontend_io_ctl_dat_o),
    .io_ctl_cyc_i(csrFrontend_io_ctl_cyc_i),
    .io_ctl_stb_i(csrFrontend_io_ctl_stb_i),
    .io_ctl_we_i(csrFrontend_io_ctl_we_i),
    .io_ctl_adr_i(csrFrontend_io_ctl_adr_i),
    .io_ctl_ack_o(csrFrontend_io_ctl_ack_o),
    .io_bus_addr(csrFrontend_io_bus_addr),
    .io_bus_dataOut(csrFrontend_io_bus_dataOut),
    .io_bus_dataIn(csrFrontend_io_bus_dataIn),
    .io_bus_write(csrFrontend_io_bus_write),
    .io_bus_read(csrFrontend_io_bus_read)
  );
  AXIStreamSlaveAXIS_WB_AXI readerFrontend ( // @[DMATop.scala 40:30:@1317.4]
    .clock(readerFrontend_clock),
    .reset(readerFrontend_reset),
    .io_bus_tdata(readerFrontend_io_bus_tdata),
    .io_bus_tvalid(readerFrontend_io_bus_tvalid),
    .io_bus_tready(readerFrontend_io_bus_tready),
    .io_dataIO_ready(readerFrontend_io_dataIO_ready),
    .io_dataIO_valid(readerFrontend_io_dataIO_valid),
    .io_dataIO_bits(readerFrontend_io_dataIO_bits),
    .io_xfer_done(readerFrontend_io_xfer_done),
    .io_xfer_length(readerFrontend_io_xfer_length),
    .io_xfer_valid(readerFrontend_io_xfer_valid)
  );
  AXI4WriterAXIS_WB_AXI writerFrontend ( // @[DMATop.scala 42:30:@1320.4]
    .clock(writerFrontend_clock),
    .reset(writerFrontend_reset),
    .io_bus_aw_awaddr(writerFrontend_io_bus_aw_awaddr),
    .io_bus_aw_awlen(writerFrontend_io_bus_aw_awlen),
    .io_bus_aw_awvalid(writerFrontend_io_bus_aw_awvalid),
    .io_bus_aw_awready(writerFrontend_io_bus_aw_awready),
    .io_bus_w_wdata(writerFrontend_io_bus_w_wdata),
    .io_bus_w_wlast(writerFrontend_io_bus_w_wlast),
    .io_bus_w_wvalid(writerFrontend_io_bus_w_wvalid),
    .io_bus_w_wready(writerFrontend_io_bus_w_wready),
    .io_bus_b_bvalid(writerFrontend_io_bus_b_bvalid),
    .io_bus_b_bready(writerFrontend_io_bus_b_bready),
    .io_dataIO_ready(writerFrontend_io_dataIO_ready),
    .io_dataIO_valid(writerFrontend_io_dataIO_valid),
    .io_dataIO_bits(writerFrontend_io_dataIO_bits),
    .io_xfer_done(writerFrontend_io_xfer_done),
    .io_xfer_address(writerFrontend_io_xfer_address),
    .io_xfer_length(writerFrontend_io_xfer_length),
    .io_xfer_valid(writerFrontend_io_xfer_valid)
  );
  CSRAXIS_WB_AXI csr ( // @[DMATop.scala 44:19:@1323.4]
    .io_csr_0_dataOut(csr_io_csr_0_dataOut),
    .io_csr_0_dataWrite(csr_io_csr_0_dataWrite),
    .io_csr_0_dataIn(csr_io_csr_0_dataIn),
    .io_csr_1_dataIn(csr_io_csr_1_dataIn),
    .io_csr_2_dataOut(csr_io_csr_2_dataOut),
    .io_csr_2_dataWrite(csr_io_csr_2_dataWrite),
    .io_csr_2_dataIn(csr_io_csr_2_dataIn),
    .io_csr_3_dataOut(csr_io_csr_3_dataOut),
    .io_csr_3_dataWrite(csr_io_csr_3_dataWrite),
    .io_csr_3_dataIn(csr_io_csr_3_dataIn),
    .io_csr_4_dataOut(csr_io_csr_4_dataOut),
    .io_csr_4_dataWrite(csr_io_csr_4_dataWrite),
    .io_csr_4_dataIn(csr_io_csr_4_dataIn),
    .io_csr_5_dataOut(csr_io_csr_5_dataOut),
    .io_csr_5_dataWrite(csr_io_csr_5_dataWrite),
    .io_csr_5_dataIn(csr_io_csr_5_dataIn),
    .io_csr_6_dataOut(csr_io_csr_6_dataOut),
    .io_csr_6_dataWrite(csr_io_csr_6_dataWrite),
    .io_csr_6_dataIn(csr_io_csr_6_dataIn),
    .io_csr_7_dataOut(csr_io_csr_7_dataOut),
    .io_csr_7_dataWrite(csr_io_csr_7_dataWrite),
    .io_csr_7_dataIn(csr_io_csr_7_dataIn),
    .io_csr_8_dataOut(csr_io_csr_8_dataOut),
    .io_csr_8_dataWrite(csr_io_csr_8_dataWrite),
    .io_csr_8_dataIn(csr_io_csr_8_dataIn),
    .io_csr_9_dataOut(csr_io_csr_9_dataOut),
    .io_csr_9_dataWrite(csr_io_csr_9_dataWrite),
    .io_csr_9_dataIn(csr_io_csr_9_dataIn),
    .io_csr_10_dataOut(csr_io_csr_10_dataOut),
    .io_csr_10_dataWrite(csr_io_csr_10_dataWrite),
    .io_csr_10_dataIn(csr_io_csr_10_dataIn),
    .io_csr_11_dataOut(csr_io_csr_11_dataOut),
    .io_csr_11_dataWrite(csr_io_csr_11_dataWrite),
    .io_csr_11_dataIn(csr_io_csr_11_dataIn),
    .io_csr_12_dataIn(csr_io_csr_12_dataIn),
    .io_csr_13_dataIn(csr_io_csr_13_dataIn),
    .io_csr_14_dataOut(csr_io_csr_14_dataOut),
    .io_csr_14_dataWrite(csr_io_csr_14_dataWrite),
    .io_csr_14_dataIn(csr_io_csr_14_dataIn),
    .io_csr_15_dataOut(csr_io_csr_15_dataOut),
    .io_csr_15_dataWrite(csr_io_csr_15_dataWrite),
    .io_csr_15_dataIn(csr_io_csr_15_dataIn),
    .io_bus_addr(csr_io_bus_addr),
    .io_bus_dataOut(csr_io_bus_dataOut),
    .io_bus_dataIn(csr_io_bus_dataIn),
    .io_bus_write(csr_io_bus_write),
    .io_bus_read(csr_io_bus_read)
  );
  WorkerCSRWrapperAXIS_WB_AXI ctl ( // @[DMATop.scala 46:19:@1326.4]
    .clock(ctl_clock),
    .reset(ctl_reset),
    .io_csr_0_dataOut(ctl_io_csr_0_dataOut),
    .io_csr_0_dataWrite(ctl_io_csr_0_dataWrite),
    .io_csr_0_dataIn(ctl_io_csr_0_dataIn),
    .io_csr_1_dataIn(ctl_io_csr_1_dataIn),
    .io_csr_2_dataOut(ctl_io_csr_2_dataOut),
    .io_csr_2_dataWrite(ctl_io_csr_2_dataWrite),
    .io_csr_2_dataIn(ctl_io_csr_2_dataIn),
    .io_csr_3_dataOut(ctl_io_csr_3_dataOut),
    .io_csr_3_dataWrite(ctl_io_csr_3_dataWrite),
    .io_csr_3_dataIn(ctl_io_csr_3_dataIn),
    .io_csr_4_dataOut(ctl_io_csr_4_dataOut),
    .io_csr_4_dataWrite(ctl_io_csr_4_dataWrite),
    .io_csr_4_dataIn(ctl_io_csr_4_dataIn),
    .io_csr_5_dataOut(ctl_io_csr_5_dataOut),
    .io_csr_5_dataWrite(ctl_io_csr_5_dataWrite),
    .io_csr_5_dataIn(ctl_io_csr_5_dataIn),
    .io_csr_6_dataOut(ctl_io_csr_6_dataOut),
    .io_csr_6_dataWrite(ctl_io_csr_6_dataWrite),
    .io_csr_6_dataIn(ctl_io_csr_6_dataIn),
    .io_csr_7_dataOut(ctl_io_csr_7_dataOut),
    .io_csr_7_dataWrite(ctl_io_csr_7_dataWrite),
    .io_csr_7_dataIn(ctl_io_csr_7_dataIn),
    .io_csr_8_dataOut(ctl_io_csr_8_dataOut),
    .io_csr_8_dataWrite(ctl_io_csr_8_dataWrite),
    .io_csr_8_dataIn(ctl_io_csr_8_dataIn),
    .io_csr_9_dataOut(ctl_io_csr_9_dataOut),
    .io_csr_9_dataWrite(ctl_io_csr_9_dataWrite),
    .io_csr_9_dataIn(ctl_io_csr_9_dataIn),
    .io_csr_10_dataOut(ctl_io_csr_10_dataOut),
    .io_csr_10_dataWrite(ctl_io_csr_10_dataWrite),
    .io_csr_10_dataIn(ctl_io_csr_10_dataIn),
    .io_csr_11_dataOut(ctl_io_csr_11_dataOut),
    .io_csr_11_dataWrite(ctl_io_csr_11_dataWrite),
    .io_csr_11_dataIn(ctl_io_csr_11_dataIn),
    .io_csr_12_dataIn(ctl_io_csr_12_dataIn),
    .io_csr_13_dataIn(ctl_io_csr_13_dataIn),
    .io_csr_14_dataOut(ctl_io_csr_14_dataOut),
    .io_csr_14_dataWrite(ctl_io_csr_14_dataWrite),
    .io_csr_14_dataIn(ctl_io_csr_14_dataIn),
    .io_csr_15_dataOut(ctl_io_csr_15_dataOut),
    .io_csr_15_dataWrite(ctl_io_csr_15_dataWrite),
    .io_csr_15_dataIn(ctl_io_csr_15_dataIn),
    .io_irq_readerDone(ctl_io_irq_readerDone),
    .io_irq_writerDone(ctl_io_irq_writerDone),
    .io_sync_readerSync(ctl_io_sync_readerSync),
    .io_sync_writerSync(ctl_io_sync_writerSync),
    .io_xferRead_done(ctl_io_xferRead_done),
    .io_xferRead_length(ctl_io_xferRead_length),
    .io_xferRead_valid(ctl_io_xferRead_valid),
    .io_xferWrite_done(ctl_io_xferWrite_done),
    .io_xferWrite_address(ctl_io_xferWrite_address),
    .io_xferWrite_length(ctl_io_xferWrite_length),
    .io_xferWrite_valid(ctl_io_xferWrite_valid)
  );
  Queue queue ( // @[Decoupled.scala 294:21:@1329.4]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  assign io_control_dat_o = csrFrontend_io_ctl_dat_o; // @[DMATop.scala 52:22:@1346.4]
  assign io_control_ack_o = csrFrontend_io_ctl_ack_o; // @[DMATop.scala 52:22:@1340.4]
  assign io_control_stall_o = 1'h0; // @[DMATop.scala 52:22:@1339.4]
  assign io_control_err_o = 1'h0; // @[DMATop.scala 52:22:@1338.4]
  assign io_read_tready = readerFrontend_io_bus_tready; // @[DMATop.scala 58:11:@1429.4]
  assign io_write_aw_awid = 4'h0; // @[DMATop.scala 59:12:@1468.4]
  assign io_write_aw_awaddr = writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 59:12:@1467.4]
  assign io_write_aw_awlen = writerFrontend_io_bus_aw_awlen; // @[DMATop.scala 59:12:@1466.4]
  assign io_write_aw_awsize = 3'h2; // @[DMATop.scala 59:12:@1465.4]
  assign io_write_aw_awburst = 2'h1; // @[DMATop.scala 59:12:@1464.4]
  assign io_write_aw_awlock = 1'h0; // @[DMATop.scala 59:12:@1463.4]
  assign io_write_aw_awcache = 4'h2; // @[DMATop.scala 59:12:@1462.4]
  assign io_write_aw_awprot = 3'h0; // @[DMATop.scala 59:12:@1461.4]
  assign io_write_aw_awqos = 4'h0; // @[DMATop.scala 59:12:@1460.4]
  assign io_write_aw_awvalid = writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 59:12:@1459.4]
  assign io_write_w_wdata = writerFrontend_io_bus_w_wdata; // @[DMATop.scala 59:12:@1457.4]
  assign io_write_w_wstrb = 4'hf; // @[DMATop.scala 59:12:@1456.4]
  assign io_write_w_wlast = writerFrontend_io_bus_w_wlast; // @[DMATop.scala 59:12:@1455.4]
  assign io_write_w_wvalid = writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 59:12:@1454.4]
  assign io_write_b_bready = writerFrontend_io_bus_b_bready; // @[DMATop.scala 59:12:@1449.4]
  assign io_write_ar_arid = 4'h0; // @[DMATop.scala 59:12:@1448.4]
  assign io_write_ar_araddr = 32'h0; // @[DMATop.scala 59:12:@1447.4]
  assign io_write_ar_arlen = 8'h0; // @[DMATop.scala 59:12:@1446.4]
  assign io_write_ar_arsize = 3'h0; // @[DMATop.scala 59:12:@1445.4]
  assign io_write_ar_arburst = 2'h0; // @[DMATop.scala 59:12:@1444.4]
  assign io_write_ar_arlock = 1'h0; // @[DMATop.scala 59:12:@1443.4]
  assign io_write_ar_arcache = 4'h0; // @[DMATop.scala 59:12:@1442.4]
  assign io_write_ar_arprot = 3'h0; // @[DMATop.scala 59:12:@1441.4]
  assign io_write_ar_arqos = 4'h0; // @[DMATop.scala 59:12:@1440.4]
  assign io_write_ar_arvalid = 1'h0; // @[DMATop.scala 59:12:@1439.4]
  assign io_write_r_rready = 1'h0; // @[DMATop.scala 59:12:@1432.4]
  assign io_irq_readerDone = ctl_io_irq_readerDone; // @[DMATop.scala 61:10:@1470.4]
  assign io_irq_writerDone = ctl_io_irq_writerDone; // @[DMATop.scala 61:10:@1469.4]
  assign csrFrontend_clock = clock; // @[:@1315.4]
  assign csrFrontend_reset = reset; // @[:@1316.4]
  assign csrFrontend_io_ctl_dat_i = io_control_dat_i; // @[DMATop.scala 52:22:@1347.4]
  assign csrFrontend_io_ctl_cyc_i = io_control_cyc_i; // @[DMATop.scala 52:22:@1345.4]
  assign csrFrontend_io_ctl_stb_i = io_control_stb_i; // @[DMATop.scala 52:22:@1344.4]
  assign csrFrontend_io_ctl_we_i = io_control_we_i; // @[DMATop.scala 52:22:@1343.4]
  assign csrFrontend_io_ctl_adr_i = io_control_adr_i; // @[DMATop.scala 52:22:@1342.4]
  assign csrFrontend_io_bus_dataIn = csr_io_bus_dataIn; // @[DMATop.scala 53:14:@1350.4]
  assign readerFrontend_clock = clock; // @[:@1318.4]
  assign readerFrontend_reset = reset; // @[:@1319.4]
  assign readerFrontend_io_bus_tdata = io_read_tdata; // @[DMATop.scala 58:11:@1431.4]
  assign readerFrontend_io_bus_tvalid = io_read_tvalid; // @[DMATop.scala 58:11:@1430.4]
  assign readerFrontend_io_dataIO_ready = queue_io_enq_ready; // @[Decoupled.scala 297:17:@1334.4]
  assign readerFrontend_io_xfer_length = ctl_io_xferRead_length; // @[DMATop.scala 55:26:@1419.4]
  assign readerFrontend_io_xfer_valid = ctl_io_xferRead_valid; // @[DMATop.scala 55:26:@1418.4]
  assign writerFrontend_clock = clock; // @[:@1321.4]
  assign writerFrontend_reset = reset; // @[:@1322.4]
  assign writerFrontend_io_bus_aw_awready = io_write_aw_awready; // @[DMATop.scala 59:12:@1458.4]
  assign writerFrontend_io_bus_w_wready = io_write_w_wready; // @[DMATop.scala 59:12:@1453.4]
  assign writerFrontend_io_bus_b_bvalid = io_write_b_bvalid; // @[DMATop.scala 59:12:@1450.4]
  assign writerFrontend_io_dataIO_valid = queue_io_deq_valid; // @[DMATop.scala 50:9:@1336.4]
  assign writerFrontend_io_dataIO_bits = queue_io_deq_bits; // @[DMATop.scala 50:9:@1335.4]
  assign writerFrontend_io_xfer_address = ctl_io_xferWrite_address; // @[DMATop.scala 56:26:@1425.4]
  assign writerFrontend_io_xfer_length = ctl_io_xferWrite_length; // @[DMATop.scala 56:26:@1424.4]
  assign writerFrontend_io_xfer_valid = ctl_io_xferWrite_valid; // @[DMATop.scala 56:26:@1423.4]
  assign csr_io_csr_0_dataIn = ctl_io_csr_0_dataIn; // @[DMATop.scala 54:14:@1353.4]
  assign csr_io_csr_1_dataIn = ctl_io_csr_1_dataIn; // @[DMATop.scala 54:14:@1357.4]
  assign csr_io_csr_2_dataIn = ctl_io_csr_2_dataIn; // @[DMATop.scala 54:14:@1361.4]
  assign csr_io_csr_3_dataIn = ctl_io_csr_3_dataIn; // @[DMATop.scala 54:14:@1365.4]
  assign csr_io_csr_4_dataIn = ctl_io_csr_4_dataIn; // @[DMATop.scala 54:14:@1369.4]
  assign csr_io_csr_5_dataIn = ctl_io_csr_5_dataIn; // @[DMATop.scala 54:14:@1373.4]
  assign csr_io_csr_6_dataIn = ctl_io_csr_6_dataIn; // @[DMATop.scala 54:14:@1377.4]
  assign csr_io_csr_7_dataIn = ctl_io_csr_7_dataIn; // @[DMATop.scala 54:14:@1381.4]
  assign csr_io_csr_8_dataIn = ctl_io_csr_8_dataIn; // @[DMATop.scala 54:14:@1385.4]
  assign csr_io_csr_9_dataIn = ctl_io_csr_9_dataIn; // @[DMATop.scala 54:14:@1389.4]
  assign csr_io_csr_10_dataIn = ctl_io_csr_10_dataIn; // @[DMATop.scala 54:14:@1393.4]
  assign csr_io_csr_11_dataIn = ctl_io_csr_11_dataIn; // @[DMATop.scala 54:14:@1397.4]
  assign csr_io_csr_12_dataIn = ctl_io_csr_12_dataIn; // @[DMATop.scala 54:14:@1401.4]
  assign csr_io_csr_13_dataIn = ctl_io_csr_13_dataIn; // @[DMATop.scala 54:14:@1405.4]
  assign csr_io_csr_14_dataIn = ctl_io_csr_14_dataIn; // @[DMATop.scala 54:14:@1409.4]
  assign csr_io_csr_15_dataIn = ctl_io_csr_15_dataIn; // @[DMATop.scala 54:14:@1413.4]
  assign csr_io_bus_addr = csrFrontend_io_bus_addr; // @[DMATop.scala 53:14:@1352.4]
  assign csr_io_bus_dataOut = csrFrontend_io_bus_dataOut; // @[DMATop.scala 53:14:@1351.4]
  assign csr_io_bus_write = csrFrontend_io_bus_write; // @[DMATop.scala 53:14:@1349.4]
  assign csr_io_bus_read = csrFrontend_io_bus_read; // @[DMATop.scala 53:14:@1348.4]
  assign ctl_clock = clock; // @[:@1327.4]
  assign ctl_reset = reset; // @[:@1328.4]
  assign ctl_io_csr_0_dataOut = csr_io_csr_0_dataOut; // @[DMATop.scala 54:14:@1355.4]
  assign ctl_io_csr_0_dataWrite = csr_io_csr_0_dataWrite; // @[DMATop.scala 54:14:@1354.4]
  assign ctl_io_csr_2_dataOut = csr_io_csr_2_dataOut; // @[DMATop.scala 54:14:@1363.4]
  assign ctl_io_csr_2_dataWrite = csr_io_csr_2_dataWrite; // @[DMATop.scala 54:14:@1362.4]
  assign ctl_io_csr_3_dataOut = csr_io_csr_3_dataOut; // @[DMATop.scala 54:14:@1367.4]
  assign ctl_io_csr_3_dataWrite = csr_io_csr_3_dataWrite; // @[DMATop.scala 54:14:@1366.4]
  assign ctl_io_csr_4_dataOut = csr_io_csr_4_dataOut; // @[DMATop.scala 54:14:@1371.4]
  assign ctl_io_csr_4_dataWrite = csr_io_csr_4_dataWrite; // @[DMATop.scala 54:14:@1370.4]
  assign ctl_io_csr_5_dataOut = csr_io_csr_5_dataOut; // @[DMATop.scala 54:14:@1375.4]
  assign ctl_io_csr_5_dataWrite = csr_io_csr_5_dataWrite; // @[DMATop.scala 54:14:@1374.4]
  assign ctl_io_csr_6_dataOut = csr_io_csr_6_dataOut; // @[DMATop.scala 54:14:@1379.4]
  assign ctl_io_csr_6_dataWrite = csr_io_csr_6_dataWrite; // @[DMATop.scala 54:14:@1378.4]
  assign ctl_io_csr_7_dataOut = csr_io_csr_7_dataOut; // @[DMATop.scala 54:14:@1383.4]
  assign ctl_io_csr_7_dataWrite = csr_io_csr_7_dataWrite; // @[DMATop.scala 54:14:@1382.4]
  assign ctl_io_csr_8_dataOut = csr_io_csr_8_dataOut; // @[DMATop.scala 54:14:@1387.4]
  assign ctl_io_csr_8_dataWrite = csr_io_csr_8_dataWrite; // @[DMATop.scala 54:14:@1386.4]
  assign ctl_io_csr_9_dataOut = csr_io_csr_9_dataOut; // @[DMATop.scala 54:14:@1391.4]
  assign ctl_io_csr_9_dataWrite = csr_io_csr_9_dataWrite; // @[DMATop.scala 54:14:@1390.4]
  assign ctl_io_csr_10_dataOut = csr_io_csr_10_dataOut; // @[DMATop.scala 54:14:@1395.4]
  assign ctl_io_csr_10_dataWrite = csr_io_csr_10_dataWrite; // @[DMATop.scala 54:14:@1394.4]
  assign ctl_io_csr_11_dataOut = csr_io_csr_11_dataOut; // @[DMATop.scala 54:14:@1399.4]
  assign ctl_io_csr_11_dataWrite = csr_io_csr_11_dataWrite; // @[DMATop.scala 54:14:@1398.4]
  assign ctl_io_csr_14_dataOut = csr_io_csr_14_dataOut; // @[DMATop.scala 54:14:@1411.4]
  assign ctl_io_csr_14_dataWrite = csr_io_csr_14_dataWrite; // @[DMATop.scala 54:14:@1410.4]
  assign ctl_io_csr_15_dataOut = csr_io_csr_15_dataOut; // @[DMATop.scala 54:14:@1415.4]
  assign ctl_io_csr_15_dataWrite = csr_io_csr_15_dataWrite; // @[DMATop.scala 54:14:@1414.4]
  assign ctl_io_sync_readerSync = io_sync_readerSync; // @[DMATop.scala 62:11:@1472.4]
  assign ctl_io_sync_writerSync = io_sync_writerSync; // @[DMATop.scala 62:11:@1471.4]
  assign ctl_io_xferRead_done = readerFrontend_io_xfer_done; // @[DMATop.scala 55:26:@1421.4]
  assign ctl_io_xferWrite_done = writerFrontend_io_xfer_done; // @[DMATop.scala 56:26:@1426.4]
  assign queue_clock = clock; // @[:@1330.4]
  assign queue_reset = reset; // @[:@1331.4]
  assign queue_io_enq_valid = readerFrontend_io_dataIO_valid; // @[Decoupled.scala 295:22:@1332.4]
  assign queue_io_enq_bits = readerFrontend_io_dataIO_bits; // @[Decoupled.scala 296:21:@1333.4]
  assign queue_io_deq_ready = writerFrontend_io_dataIO_ready; // @[DMATop.scala 50:9:@1337.4]
endmodule
