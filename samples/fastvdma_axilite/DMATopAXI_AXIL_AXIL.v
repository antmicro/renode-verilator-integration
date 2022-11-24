module AXI4LiteCSRAXI_AXIL_AXIL( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_ctl_aw_awaddr, // @[:@6.4]
  input         io_ctl_aw_awvalid, // @[:@6.4]
  output        io_ctl_aw_awready, // @[:@6.4]
  input  [31:0] io_ctl_w_wdata, // @[:@6.4]
  input         io_ctl_w_wvalid, // @[:@6.4]
  output        io_ctl_w_wready, // @[:@6.4]
  output        io_ctl_b_bvalid, // @[:@6.4]
  input         io_ctl_b_bready, // @[:@6.4]
  input  [31:0] io_ctl_ar_araddr, // @[:@6.4]
  input         io_ctl_ar_arvalid, // @[:@6.4]
  output        io_ctl_ar_arready, // @[:@6.4]
  output [31:0] io_ctl_r_rdata, // @[:@6.4]
  output        io_ctl_r_rvalid, // @[:@6.4]
  input         io_ctl_r_rready, // @[:@6.4]
  output [3:0]  io_bus_addr, // @[:@6.4]
  output [31:0] io_bus_dataOut, // @[:@6.4]
  input  [31:0] io_bus_dataIn, // @[:@6.4]
  output        io_bus_write, // @[:@6.4]
  output        io_bus_read // @[:@6.4]
);
  reg [2:0] state; // @[AXI4LiteCSR.scala 31:22:@8.4]
  reg [31:0] _RAND_0;
  reg  awready; // @[AXI4LiteCSR.scala 33:24:@9.4]
  reg [31:0] _RAND_1;
  reg  wready; // @[AXI4LiteCSR.scala 34:23:@10.4]
  reg [31:0] _RAND_2;
  reg  bvalid; // @[AXI4LiteCSR.scala 35:23:@11.4]
  reg [31:0] _RAND_3;
  reg  arready; // @[AXI4LiteCSR.scala 38:24:@14.4]
  reg [31:0] _RAND_4;
  reg  rvalid; // @[AXI4LiteCSR.scala 39:23:@15.4]
  reg [31:0] _RAND_5;
  reg [31:0] addr; // @[AXI4LiteCSR.scala 42:21:@18.4]
  reg [31:0] _RAND_6;
  wire  _T_110; // @[AXI4LiteCSR.scala 56:34:@28.4]
  wire  _T_111; // @[AXI4LiteCSR.scala 57:35:@30.4]
  wire  _T_112; // @[Conditional.scala 37:30:@33.4]
  wire [3:0] _T_113; // @[AXI4LiteCSR.scala 64:33:@37.8]
  wire [3:0] _T_115; // @[AXI4LiteCSR.scala 69:33:@44.10]
  wire [2:0] _GEN_0; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire [31:0] _GEN_1; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire  _GEN_2; // @[AXI4LiteCSR.scala 67:36:@42.8]
  wire [2:0] _GEN_3; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire [31:0] _GEN_4; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _GEN_5; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _GEN_6; // @[AXI4LiteCSR.scala 62:30:@35.6]
  wire  _T_117; // @[Conditional.scala 37:30:@50.6]
  wire  _T_118; // @[AXI4LiteCSR.scala 74:30:@52.8]
  wire [2:0] _GEN_7; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _GEN_8; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _GEN_9; // @[AXI4LiteCSR.scala 74:41:@53.8]
  wire  _T_121; // @[Conditional.scala 37:30:@60.8]
  wire [2:0] _GEN_10; // @[AXI4LiteCSR.scala 81:38:@63.10]
  wire  _GEN_11; // @[AXI4LiteCSR.scala 81:38:@63.10]
  wire  _T_124; // @[Conditional.scala 37:30:@69.10]
  wire  _T_125; // @[AXI4LiteCSR.scala 87:30:@71.12]
  wire [2:0] _GEN_12; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _GEN_13; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _GEN_14; // @[AXI4LiteCSR.scala 87:41:@72.12]
  wire  _T_128; // @[Conditional.scala 37:30:@79.12]
  wire [2:0] _GEN_15; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _GEN_16; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _GEN_17; // @[AXI4LiteCSR.scala 94:38:@82.14]
  wire  _T_132; // @[Conditional.scala 37:30:@89.14]
  wire  _T_133; // @[AXI4LiteCSR.scala 101:28:@91.16]
  wire [2:0] _GEN_18; // @[AXI4LiteCSR.scala 101:38:@92.16]
  wire  _GEN_19; // @[AXI4LiteCSR.scala 101:38:@92.16]
  wire [2:0] _GEN_20; // @[Conditional.scala 39:67:@90.14]
  wire  _GEN_21; // @[Conditional.scala 39:67:@90.14]
  wire [2:0] _GEN_22; // @[Conditional.scala 39:67:@80.12]
  wire  _GEN_23; // @[Conditional.scala 39:67:@80.12]
  wire  _GEN_24; // @[Conditional.scala 39:67:@80.12]
  wire [2:0] _GEN_25; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_26; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_27; // @[Conditional.scala 39:67:@70.10]
  wire  _GEN_28; // @[Conditional.scala 39:67:@70.10]
  wire [2:0] _GEN_29; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_30; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_31; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_32; // @[Conditional.scala 39:67:@61.8]
  wire  _GEN_33; // @[Conditional.scala 39:67:@61.8]
  wire [2:0] _GEN_34; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_35; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_36; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_37; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_38; // @[Conditional.scala 39:67:@51.6]
  wire  _GEN_39; // @[Conditional.scala 39:67:@51.6]
  wire [2:0] _GEN_40; // @[Conditional.scala 40:58:@34.4]
  wire [31:0] _GEN_41; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_42; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_43; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_44; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_45; // @[Conditional.scala 40:58:@34.4]
  wire  _GEN_46; // @[Conditional.scala 40:58:@34.4]
  assign _T_110 = io_ctl_r_rready & rvalid; // @[AXI4LiteCSR.scala 56:34:@28.4]
  assign _T_111 = io_ctl_w_wvalid & wready; // @[AXI4LiteCSR.scala 57:35:@30.4]
  assign _T_112 = 3'h0 == state; // @[Conditional.scala 37:30:@33.4]
  assign _T_113 = io_ctl_aw_awaddr[5:2]; // @[AXI4LiteCSR.scala 64:33:@37.8]
  assign _T_115 = io_ctl_ar_araddr[5:2]; // @[AXI4LiteCSR.scala 69:33:@44.10]
  assign _GEN_0 = io_ctl_ar_arvalid ? 3'h1 : state; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_1 = io_ctl_ar_arvalid ? {{28'd0}, _T_115} : addr; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_2 = io_ctl_ar_arvalid ? 1'h1 : arready; // @[AXI4LiteCSR.scala 67:36:@42.8]
  assign _GEN_3 = io_ctl_aw_awvalid ? 3'h3 : _GEN_0; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_4 = io_ctl_aw_awvalid ? {{28'd0}, _T_113} : _GEN_1; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_5 = io_ctl_aw_awvalid ? 1'h1 : awready; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _GEN_6 = io_ctl_aw_awvalid ? arready : _GEN_2; // @[AXI4LiteCSR.scala 62:30:@35.6]
  assign _T_117 = 3'h1 == state; // @[Conditional.scala 37:30:@50.6]
  assign _T_118 = io_ctl_ar_arvalid & arready; // @[AXI4LiteCSR.scala 74:30:@52.8]
  assign _GEN_7 = _T_118 ? 3'h2 : state; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _GEN_8 = _T_118 ? 1'h0 : arready; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _GEN_9 = _T_118 ? 1'h1 : rvalid; // @[AXI4LiteCSR.scala 74:41:@53.8]
  assign _T_121 = 3'h2 == state; // @[Conditional.scala 37:30:@60.8]
  assign _GEN_10 = _T_110 ? 3'h0 : state; // @[AXI4LiteCSR.scala 81:38:@63.10]
  assign _GEN_11 = _T_110 ? 1'h0 : rvalid; // @[AXI4LiteCSR.scala 81:38:@63.10]
  assign _T_124 = 3'h3 == state; // @[Conditional.scala 37:30:@69.10]
  assign _T_125 = io_ctl_aw_awvalid & awready; // @[AXI4LiteCSR.scala 87:30:@71.12]
  assign _GEN_12 = _T_125 ? 3'h4 : state; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _GEN_13 = _T_125 ? 1'h0 : awready; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _GEN_14 = _T_125 ? 1'h1 : wready; // @[AXI4LiteCSR.scala 87:41:@72.12]
  assign _T_128 = 3'h4 == state; // @[Conditional.scala 37:30:@79.12]
  assign _GEN_15 = _T_111 ? 3'h5 : state; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _GEN_16 = _T_111 ? 1'h0 : wready; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _GEN_17 = _T_111 ? 1'h1 : bvalid; // @[AXI4LiteCSR.scala 94:38:@82.14]
  assign _T_132 = 3'h5 == state; // @[Conditional.scala 37:30:@89.14]
  assign _T_133 = io_ctl_b_bready & bvalid; // @[AXI4LiteCSR.scala 101:28:@91.16]
  assign _GEN_18 = _T_133 ? 3'h0 : state; // @[AXI4LiteCSR.scala 101:38:@92.16]
  assign _GEN_19 = _T_133 ? 1'h0 : bvalid; // @[AXI4LiteCSR.scala 101:38:@92.16]
  assign _GEN_20 = _T_132 ? _GEN_18 : state; // @[Conditional.scala 39:67:@90.14]
  assign _GEN_21 = _T_132 ? _GEN_19 : bvalid; // @[Conditional.scala 39:67:@90.14]
  assign _GEN_22 = _T_128 ? _GEN_15 : _GEN_20; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_23 = _T_128 ? _GEN_16 : wready; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_24 = _T_128 ? _GEN_17 : _GEN_21; // @[Conditional.scala 39:67:@80.12]
  assign _GEN_25 = _T_124 ? _GEN_12 : _GEN_22; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_26 = _T_124 ? _GEN_13 : awready; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_27 = _T_124 ? _GEN_14 : _GEN_23; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_28 = _T_124 ? bvalid : _GEN_24; // @[Conditional.scala 39:67:@70.10]
  assign _GEN_29 = _T_121 ? _GEN_10 : _GEN_25; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_30 = _T_121 ? _GEN_11 : rvalid; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_31 = _T_121 ? awready : _GEN_26; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_32 = _T_121 ? wready : _GEN_27; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_33 = _T_121 ? bvalid : _GEN_28; // @[Conditional.scala 39:67:@61.8]
  assign _GEN_34 = _T_117 ? _GEN_7 : _GEN_29; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_35 = _T_117 ? _GEN_8 : arready; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_36 = _T_117 ? _GEN_9 : _GEN_30; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_37 = _T_117 ? awready : _GEN_31; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_38 = _T_117 ? wready : _GEN_32; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_39 = _T_117 ? bvalid : _GEN_33; // @[Conditional.scala 39:67:@51.6]
  assign _GEN_40 = _T_112 ? _GEN_3 : _GEN_34; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_41 = _T_112 ? _GEN_4 : addr; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_42 = _T_112 ? _GEN_5 : _GEN_37; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_43 = _T_112 ? _GEN_6 : _GEN_35; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_44 = _T_112 ? rvalid : _GEN_36; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_45 = _T_112 ? wready : _GEN_38; // @[Conditional.scala 40:58:@34.4]
  assign _GEN_46 = _T_112 ? bvalid : _GEN_39; // @[Conditional.scala 40:58:@34.4]
  assign io_ctl_aw_awready = awready; // @[AXI4LiteCSR.scala 47:21:@21.4]
  assign io_ctl_w_wready = wready; // @[AXI4LiteCSR.scala 48:19:@22.4]
  assign io_ctl_b_bvalid = bvalid; // @[AXI4LiteCSR.scala 49:19:@23.4]
  assign io_ctl_ar_arready = arready; // @[AXI4LiteCSR.scala 52:21:@25.4]
  assign io_ctl_r_rdata = io_bus_dataIn; // @[AXI4LiteCSR.scala 44:18:@19.4]
  assign io_ctl_r_rvalid = rvalid; // @[AXI4LiteCSR.scala 53:19:@26.4]
  assign io_bus_addr = addr[3:0]; // @[AXI4LiteCSR.scala 58:15:@32.4]
  assign io_bus_dataOut = io_ctl_w_wdata; // @[AXI4LiteCSR.scala 45:18:@20.4]
  assign io_bus_write = io_ctl_w_wvalid & wready; // @[AXI4LiteCSR.scala 57:16:@31.4]
  assign io_bus_read = io_ctl_r_rready & rvalid; // @[AXI4LiteCSR.scala 56:15:@29.4]
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
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  awready = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wready = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  bvalid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arready = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  rvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          state <= 3'h3;
        end else begin
          if (io_ctl_ar_arvalid) begin
            state <= 3'h1;
          end
        end
      end else begin
        if (_T_117) begin
          if (_T_118) begin
            state <= 3'h2;
          end
        end else begin
          if (_T_121) begin
            if (_T_110) begin
              state <= 3'h0;
            end
          end else begin
            if (_T_124) begin
              if (_T_125) begin
                state <= 3'h4;
              end
            end else begin
              if (_T_128) begin
                if (_T_111) begin
                  state <= 3'h5;
                end
              end else begin
                if (_T_132) begin
                  if (_T_133) begin
                    state <= 3'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      awready <= 1'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          awready <= 1'h1;
        end
      end else begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (_T_124) begin
              if (_T_125) begin
                awready <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      wready <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (_T_124) begin
              if (_T_125) begin
                wready <= 1'h1;
              end
            end else begin
              if (_T_128) begin
                if (_T_111) begin
                  wready <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      bvalid <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (!(_T_117)) begin
          if (!(_T_121)) begin
            if (!(_T_124)) begin
              if (_T_128) begin
                if (_T_111) begin
                  bvalid <= 1'h1;
                end
              end else begin
                if (_T_132) begin
                  if (_T_133) begin
                    bvalid <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      arready <= 1'h0;
    end else begin
      if (_T_112) begin
        if (!(io_ctl_aw_awvalid)) begin
          if (io_ctl_ar_arvalid) begin
            arready <= 1'h1;
          end
        end
      end else begin
        if (_T_117) begin
          if (_T_118) begin
            arready <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      rvalid <= 1'h0;
    end else begin
      if (!(_T_112)) begin
        if (_T_117) begin
          if (_T_118) begin
            rvalid <= 1'h1;
          end
        end else begin
          if (_T_121) begin
            if (_T_110) begin
              rvalid <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addr <= 32'h0;
    end else begin
      if (_T_112) begin
        if (io_ctl_aw_awvalid) begin
          addr <= {{28'd0}, _T_113};
        end else begin
          if (io_ctl_ar_arvalid) begin
            addr <= {{28'd0}, _T_115};
          end
        end
      end
    end
  end
endmodule
module AXI4ReaderAXI_AXIL_AXIL( // @[:@98.2]
  input         clock, // @[:@99.4]
  input         reset, // @[:@100.4]
  output [31:0] io_bus_ar_araddr, // @[:@101.4]
  output [7:0]  io_bus_ar_arlen, // @[:@101.4]
  output        io_bus_ar_arvalid, // @[:@101.4]
  input         io_bus_ar_arready, // @[:@101.4]
  input  [31:0] io_bus_r_rdata, // @[:@101.4]
  input         io_bus_r_rlast, // @[:@101.4]
  input         io_bus_r_rvalid, // @[:@101.4]
  output        io_bus_r_rready, // @[:@101.4]
  input         io_dataIO_ready, // @[:@101.4]
  output        io_dataIO_valid, // @[:@101.4]
  output [31:0] io_dataIO_bits, // @[:@101.4]
  output        io_xfer_done, // @[:@101.4]
  input  [31:0] io_xfer_address, // @[:@101.4]
  input  [31:0] io_xfer_length, // @[:@101.4]
  input         io_xfer_valid // @[:@101.4]
);
  reg [1:0] state; // @[AXI4Reader.scala 34:22:@103.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXI4Reader.scala 36:21:@104.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXI4Reader.scala 37:23:@105.4]
  reg [31:0] _RAND_2;
  reg [31:0] araddr; // @[AXI4Reader.scala 39:23:@107.4]
  reg [31:0] _RAND_3;
  reg [7:0] arlen; // @[AXI4Reader.scala 40:22:@108.4]
  reg [31:0] _RAND_4;
  reg  arvalid; // @[AXI4Reader.scala 41:24:@109.4]
  reg [31:0] _RAND_5;
  wire  ready; // @[AXI4Reader.scala 44:40:@112.4]
  wire  valid; // @[AXI4Reader.scala 45:40:@115.4]
  wire  _T_231; // @[Conditional.scala 37:30:@189.4]
  wire [32:0] _T_235; // @[AXI4Reader.scala 64:33:@196.8]
  wire [32:0] _T_236; // @[AXI4Reader.scala 64:33:@197.8]
  wire [31:0] _T_237; // @[AXI4Reader.scala 64:33:@198.8]
  wire [1:0] _GEN_0; // @[AXI4Reader.scala 60:26:@192.6]
  wire  _GEN_1; // @[AXI4Reader.scala 60:26:@192.6]
  wire [31:0] _GEN_2; // @[AXI4Reader.scala 60:26:@192.6]
  wire [31:0] _GEN_3; // @[AXI4Reader.scala 60:26:@192.6]
  wire  _T_238; // @[Conditional.scala 37:30:@203.6]
  wire  _T_239; // @[AXI4Reader.scala 68:20:@205.8]
  wire [1:0] _GEN_4; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _GEN_5; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _GEN_6; // @[AXI4Reader.scala 68:41:@206.8]
  wire  _T_242; // @[Conditional.scala 37:30:@213.8]
  wire  _T_243; // @[AXI4Reader.scala 75:18:@215.10]
  wire [1:0] _GEN_7; // @[AXI4Reader.scala 76:29:@217.12]
  wire  _GEN_8; // @[AXI4Reader.scala 76:29:@217.12]
  wire [1:0] _GEN_9; // @[AXI4Reader.scala 75:27:@216.10]
  wire  _GEN_10; // @[AXI4Reader.scala 75:27:@216.10]
  wire  _T_245; // @[Conditional.scala 37:30:@224.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@225.10]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@225.10]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@214.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@214.8]
  wire  _GEN_15; // @[Conditional.scala 39:67:@214.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@204.6]
  wire  _GEN_20; // @[Conditional.scala 40:58:@190.4]
  wire [1:0] _GEN_21; // @[Conditional.scala 40:58:@190.4]
  wire  _GEN_22; // @[Conditional.scala 40:58:@190.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@190.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@190.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@190.4]
  assign ready = io_dataIO_ready & enable; // @[AXI4Reader.scala 44:40:@112.4]
  assign valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 45:40:@115.4]
  assign _T_231 = 2'h0 == state; // @[Conditional.scala 37:30:@189.4]
  assign _T_235 = io_xfer_length - 32'h1; // @[AXI4Reader.scala 64:33:@196.8]
  assign _T_236 = $unsigned(_T_235); // @[AXI4Reader.scala 64:33:@197.8]
  assign _T_237 = _T_236[31:0]; // @[AXI4Reader.scala 64:33:@198.8]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_1 = io_xfer_valid ? 1'h1 : arvalid; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_2 = io_xfer_valid ? io_xfer_address : araddr; // @[AXI4Reader.scala 60:26:@192.6]
  assign _GEN_3 = io_xfer_valid ? _T_237 : {{24'd0}, arlen}; // @[AXI4Reader.scala 60:26:@192.6]
  assign _T_238 = 2'h1 == state; // @[Conditional.scala 37:30:@203.6]
  assign _T_239 = arvalid & io_bus_ar_arready; // @[AXI4Reader.scala 68:20:@205.8]
  assign _GEN_4 = _T_239 ? 2'h2 : state; // @[AXI4Reader.scala 68:41:@206.8]
  assign _GEN_5 = _T_239 ? 1'h0 : arvalid; // @[AXI4Reader.scala 68:41:@206.8]
  assign _GEN_6 = _T_239 ? 1'h1 : enable; // @[AXI4Reader.scala 68:41:@206.8]
  assign _T_242 = 2'h2 == state; // @[Conditional.scala 37:30:@213.8]
  assign _T_243 = ready & valid; // @[AXI4Reader.scala 75:18:@215.10]
  assign _GEN_7 = io_bus_r_rlast ? 2'h3 : state; // @[AXI4Reader.scala 76:29:@217.12]
  assign _GEN_8 = io_bus_r_rlast ? 1'h0 : enable; // @[AXI4Reader.scala 76:29:@217.12]
  assign _GEN_9 = _T_243 ? _GEN_7 : state; // @[AXI4Reader.scala 75:27:@216.10]
  assign _GEN_10 = _T_243 ? _GEN_8 : enable; // @[AXI4Reader.scala 75:27:@216.10]
  assign _T_245 = 2'h3 == state; // @[Conditional.scala 37:30:@224.10]
  assign _GEN_11 = _T_245 ? 1'h1 : done; // @[Conditional.scala 39:67:@225.10]
  assign _GEN_12 = _T_245 ? 2'h0 : state; // @[Conditional.scala 39:67:@225.10]
  assign _GEN_13 = _T_242 ? _GEN_9 : _GEN_12; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_14 = _T_242 ? _GEN_10 : enable; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_15 = _T_242 ? done : _GEN_11; // @[Conditional.scala 39:67:@214.8]
  assign _GEN_16 = _T_238 ? _GEN_4 : _GEN_13; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_17 = _T_238 ? _GEN_5 : arvalid; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_18 = _T_238 ? _GEN_6 : _GEN_14; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_19 = _T_238 ? done : _GEN_15; // @[Conditional.scala 39:67:@204.6]
  assign _GEN_20 = _T_231 ? 1'h0 : _GEN_19; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_21 = _T_231 ? _GEN_0 : _GEN_16; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_22 = _T_231 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_23 = _T_231 ? _GEN_2 : araddr; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_24 = _T_231 ? _GEN_3 : {{24'd0}, arlen}; // @[Conditional.scala 40:58:@190.4]
  assign _GEN_25 = _T_231 ? enable : _GEN_18; // @[Conditional.scala 40:58:@190.4]
  assign io_bus_ar_araddr = araddr; // @[AXI4Reader.scala 50:13:@176.4]
  assign io_bus_ar_arlen = arlen; // @[AXI4Reader.scala 50:13:@175.4]
  assign io_bus_ar_arvalid = arvalid; // @[AXI4Reader.scala 50:13:@168.4]
  assign io_bus_r_rready = io_dataIO_ready & enable; // @[AXI4Reader.scala 51:12:@180.4]
  assign io_dataIO_valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 53:19:@186.4]
  assign io_dataIO_bits = io_bus_r_rdata; // @[AXI4Reader.scala 54:18:@187.4]
  assign io_xfer_done = done; // @[AXI4Reader.scala 55:16:@188.4]
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
  araddr = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arlen = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  arvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_238) begin
          if (_T_239) begin
            state <= 2'h2;
          end
        end else begin
          if (_T_242) begin
            if (_T_243) begin
              if (io_bus_r_rlast) begin
                state <= 2'h3;
              end
            end
          end else begin
            if (_T_245) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_231) begin
        done <= 1'h0;
      end else begin
        if (!(_T_238)) begin
          if (!(_T_242)) begin
            if (_T_245) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (!(_T_231)) begin
        if (_T_238) begin
          if (_T_239) begin
            enable <= 1'h1;
          end
        end else begin
          if (_T_242) begin
            if (_T_243) begin
              if (io_bus_r_rlast) begin
                enable <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      araddr <= 32'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          araddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      arlen <= 8'h0;
    end else begin
      arlen <= _GEN_24[7:0];
    end
    if (reset) begin
      arvalid <= 1'h0;
    end else begin
      if (_T_231) begin
        if (io_xfer_valid) begin
          arvalid <= 1'h1;
        end
      end else begin
        if (_T_238) begin
          if (_T_239) begin
            arvalid <= 1'h0;
          end
        end
      end
    end
  end
endmodule
module AXI4LiteWriterAXI_AXIL_AXIL( // @[:@230.2]
  input         clock, // @[:@231.4]
  input         reset, // @[:@232.4]
  output [31:0] io_bus_aw_awaddr, // @[:@233.4]
  output        io_bus_aw_awvalid, // @[:@233.4]
  input         io_bus_aw_awready, // @[:@233.4]
  output [31:0] io_bus_w_wdata, // @[:@233.4]
  output        io_bus_w_wvalid, // @[:@233.4]
  input         io_bus_w_wready, // @[:@233.4]
  input         io_bus_b_bvalid, // @[:@233.4]
  output        io_bus_b_bready, // @[:@233.4]
  output        io_dataIO_ready, // @[:@233.4]
  input         io_dataIO_valid, // @[:@233.4]
  input  [31:0] io_dataIO_bits, // @[:@233.4]
  output        io_xfer_done, // @[:@233.4]
  input  [31:0] io_xfer_address, // @[:@233.4]
  input         io_xfer_valid // @[:@233.4]
);
  reg [1:0] dataState; // @[AXI4LiteWriter.scala 35:26:@235.4]
  reg [31:0] _RAND_0;
  reg [1:0] addrState; // @[AXI4LiteWriter.scala 36:26:@236.4]
  reg [31:0] _RAND_1;
  reg  done; // @[AXI4LiteWriter.scala 38:21:@237.4]
  reg [31:0] _RAND_2;
  reg  enable; // @[AXI4LiteWriter.scala 39:23:@238.4]
  reg [31:0] _RAND_3;
  reg [31:0] awaddr; // @[AXI4LiteWriter.scala 40:23:@239.4]
  reg [31:0] _RAND_4;
  reg  awvalid; // @[AXI4LiteWriter.scala 44:24:@243.4]
  reg [31:0] _RAND_5;
  reg  bready; // @[AXI4LiteWriter.scala 45:23:@244.4]
  reg [31:0] _RAND_6;
  wire  ready; // @[AXI4LiteWriter.scala 47:40:@245.4]
  wire  valid; // @[AXI4LiteWriter.scala 48:40:@248.4]
  wire  _T_149; // @[Conditional.scala 37:30:@288.4]
  wire [1:0] _GEN_0; // @[AXI4LiteWriter.scala 63:26:@291.6]
  wire  _GEN_1; // @[AXI4LiteWriter.scala 63:26:@291.6]
  wire  _T_152; // @[Conditional.scala 37:30:@297.6]
  wire  _T_153; // @[AXI4LiteWriter.scala 69:18:@299.8]
  wire [1:0] _GEN_2; // @[AXI4LiteWriter.scala 69:27:@300.8]
  wire  _GEN_3; // @[AXI4LiteWriter.scala 69:27:@300.8]
  wire  _GEN_4; // @[AXI4LiteWriter.scala 69:27:@300.8]
  wire  _T_156; // @[Conditional.scala 37:30:@307.8]
  wire  _T_157; // @[AXI4LiteWriter.scala 76:19:@309.10]
  wire  _GEN_5; // @[AXI4LiteWriter.scala 76:38:@310.10]
  wire [1:0] _GEN_6; // @[AXI4LiteWriter.scala 76:38:@310.10]
  wire  _T_159; // @[Conditional.scala 37:30:@316.10]
  wire  _GEN_7; // @[Conditional.scala 39:67:@317.10]
  wire [1:0] _GEN_8; // @[Conditional.scala 39:67:@317.10]
  wire  _GEN_9; // @[Conditional.scala 39:67:@308.8]
  wire [1:0] _GEN_10; // @[Conditional.scala 39:67:@308.8]
  wire  _GEN_11; // @[Conditional.scala 39:67:@308.8]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@298.6]
  wire  _GEN_13; // @[Conditional.scala 39:67:@298.6]
  wire  _GEN_14; // @[Conditional.scala 39:67:@298.6]
  wire  _GEN_15; // @[Conditional.scala 39:67:@298.6]
  wire  _GEN_16; // @[Conditional.scala 40:58:@289.4]
  wire [1:0] _GEN_17; // @[Conditional.scala 40:58:@289.4]
  wire  _GEN_18; // @[Conditional.scala 40:58:@289.4]
  wire  _GEN_19; // @[Conditional.scala 40:58:@289.4]
  wire  _T_161; // @[Conditional.scala 37:30:@321.4]
  wire [31:0] _GEN_20; // @[AXI4LiteWriter.scala 89:26:@323.6]
  wire  _GEN_21; // @[AXI4LiteWriter.scala 89:26:@323.6]
  wire [1:0] _GEN_22; // @[AXI4LiteWriter.scala 89:26:@323.6]
  wire  _T_163; // @[Conditional.scala 37:30:@330.6]
  wire  _T_164; // @[AXI4LiteWriter.scala 96:20:@332.8]
  wire [1:0] _GEN_23; // @[AXI4LiteWriter.scala 96:41:@333.8]
  wire  _GEN_24; // @[AXI4LiteWriter.scala 96:41:@333.8]
  wire  _T_166; // @[Conditional.scala 37:30:@339.8]
  wire [1:0] _GEN_25; // @[AXI4LiteWriter.scala 102:17:@341.10]
  wire [1:0] _GEN_26; // @[Conditional.scala 39:67:@340.8]
  wire [1:0] _GEN_27; // @[Conditional.scala 39:67:@331.6]
  wire  _GEN_28; // @[Conditional.scala 39:67:@331.6]
  wire [31:0] _GEN_29; // @[Conditional.scala 40:58:@322.4]
  wire  _GEN_30; // @[Conditional.scala 40:58:@322.4]
  wire [1:0] _GEN_31; // @[Conditional.scala 40:58:@322.4]
  assign ready = io_bus_w_wready & enable; // @[AXI4LiteWriter.scala 47:40:@245.4]
  assign valid = io_dataIO_valid & enable; // @[AXI4LiteWriter.scala 48:40:@248.4]
  assign _T_149 = 2'h0 == dataState; // @[Conditional.scala 37:30:@288.4]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : dataState; // @[AXI4LiteWriter.scala 63:26:@291.6]
  assign _GEN_1 = io_xfer_valid ? 1'h1 : enable; // @[AXI4LiteWriter.scala 63:26:@291.6]
  assign _T_152 = 2'h1 == dataState; // @[Conditional.scala 37:30:@297.6]
  assign _T_153 = ready & valid; // @[AXI4LiteWriter.scala 69:18:@299.8]
  assign _GEN_2 = _T_153 ? 2'h2 : dataState; // @[AXI4LiteWriter.scala 69:27:@300.8]
  assign _GEN_3 = _T_153 ? 1'h0 : enable; // @[AXI4LiteWriter.scala 69:27:@300.8]
  assign _GEN_4 = _T_153 ? 1'h1 : bready; // @[AXI4LiteWriter.scala 69:27:@300.8]
  assign _T_156 = 2'h2 == dataState; // @[Conditional.scala 37:30:@307.8]
  assign _T_157 = bready & io_bus_b_bvalid; // @[AXI4LiteWriter.scala 76:19:@309.10]
  assign _GEN_5 = _T_157 ? 1'h0 : bready; // @[AXI4LiteWriter.scala 76:38:@310.10]
  assign _GEN_6 = _T_157 ? 2'h3 : dataState; // @[AXI4LiteWriter.scala 76:38:@310.10]
  assign _T_159 = 2'h3 == dataState; // @[Conditional.scala 37:30:@316.10]
  assign _GEN_7 = _T_159 ? 1'h1 : done; // @[Conditional.scala 39:67:@317.10]
  assign _GEN_8 = _T_159 ? 2'h0 : dataState; // @[Conditional.scala 39:67:@317.10]
  assign _GEN_9 = _T_156 ? _GEN_5 : bready; // @[Conditional.scala 39:67:@308.8]
  assign _GEN_10 = _T_156 ? _GEN_6 : _GEN_8; // @[Conditional.scala 39:67:@308.8]
  assign _GEN_11 = _T_156 ? done : _GEN_7; // @[Conditional.scala 39:67:@308.8]
  assign _GEN_12 = _T_152 ? _GEN_2 : _GEN_10; // @[Conditional.scala 39:67:@298.6]
  assign _GEN_13 = _T_152 ? _GEN_3 : enable; // @[Conditional.scala 39:67:@298.6]
  assign _GEN_14 = _T_152 ? _GEN_4 : _GEN_9; // @[Conditional.scala 39:67:@298.6]
  assign _GEN_15 = _T_152 ? done : _GEN_11; // @[Conditional.scala 39:67:@298.6]
  assign _GEN_16 = _T_149 ? 1'h0 : _GEN_15; // @[Conditional.scala 40:58:@289.4]
  assign _GEN_17 = _T_149 ? _GEN_0 : _GEN_12; // @[Conditional.scala 40:58:@289.4]
  assign _GEN_18 = _T_149 ? _GEN_1 : _GEN_13; // @[Conditional.scala 40:58:@289.4]
  assign _GEN_19 = _T_149 ? bready : _GEN_14; // @[Conditional.scala 40:58:@289.4]
  assign _T_161 = 2'h0 == addrState; // @[Conditional.scala 37:30:@321.4]
  assign _GEN_20 = io_xfer_valid ? io_xfer_address : awaddr; // @[AXI4LiteWriter.scala 89:26:@323.6]
  assign _GEN_21 = io_xfer_valid ? 1'h1 : awvalid; // @[AXI4LiteWriter.scala 89:26:@323.6]
  assign _GEN_22 = io_xfer_valid ? 2'h1 : addrState; // @[AXI4LiteWriter.scala 89:26:@323.6]
  assign _T_163 = 2'h1 == addrState; // @[Conditional.scala 37:30:@330.6]
  assign _T_164 = awvalid & io_bus_aw_awready; // @[AXI4LiteWriter.scala 96:20:@332.8]
  assign _GEN_23 = _T_164 ? 2'h2 : addrState; // @[AXI4LiteWriter.scala 96:41:@333.8]
  assign _GEN_24 = _T_164 ? 1'h0 : awvalid; // @[AXI4LiteWriter.scala 96:41:@333.8]
  assign _T_166 = 2'h2 == addrState; // @[Conditional.scala 37:30:@339.8]
  assign _GEN_25 = done ? 2'h0 : addrState; // @[AXI4LiteWriter.scala 102:17:@341.10]
  assign _GEN_26 = _T_166 ? _GEN_25 : addrState; // @[Conditional.scala 39:67:@340.8]
  assign _GEN_27 = _T_163 ? _GEN_23 : _GEN_26; // @[Conditional.scala 39:67:@331.6]
  assign _GEN_28 = _T_163 ? _GEN_24 : awvalid; // @[Conditional.scala 39:67:@331.6]
  assign _GEN_29 = _T_161 ? _GEN_20 : awaddr; // @[Conditional.scala 40:58:@322.4]
  assign _GEN_30 = _T_161 ? _GEN_21 : _GEN_28; // @[Conditional.scala 40:58:@322.4]
  assign _GEN_31 = _T_161 ? _GEN_22 : _GEN_27; // @[Conditional.scala 40:58:@322.4]
  assign io_bus_aw_awaddr = awaddr; // @[AXI4LiteWriter.scala 50:13:@258.4]
  assign io_bus_aw_awvalid = awvalid; // @[AXI4LiteWriter.scala 50:13:@256.4]
  assign io_bus_w_wdata = io_dataIO_bits; // @[AXI4LiteWriter.scala 51:12:@266.4]
  assign io_bus_w_wvalid = io_dataIO_valid & enable; // @[AXI4LiteWriter.scala 51:12:@264.4]
  assign io_bus_b_bready = bready; // @[AXI4LiteWriter.scala 52:12:@269.4]
  assign io_dataIO_ready = io_bus_w_wready & enable; // @[AXI4LiteWriter.scala 56:19:@286.4]
  assign io_xfer_done = done; // @[AXI4LiteWriter.scala 58:16:@287.4]
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
  awaddr = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  awvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  bready = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dataState <= 2'h0;
    end else begin
      if (_T_149) begin
        if (io_xfer_valid) begin
          dataState <= 2'h1;
        end
      end else begin
        if (_T_152) begin
          if (_T_153) begin
            dataState <= 2'h2;
          end
        end else begin
          if (_T_156) begin
            if (_T_157) begin
              dataState <= 2'h3;
            end
          end else begin
            if (_T_159) begin
              dataState <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addrState <= 2'h0;
    end else begin
      if (_T_161) begin
        if (io_xfer_valid) begin
          addrState <= 2'h1;
        end
      end else begin
        if (_T_163) begin
          if (_T_164) begin
            addrState <= 2'h2;
          end
        end else begin
          if (_T_166) begin
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
      if (_T_149) begin
        done <= 1'h0;
      end else begin
        if (!(_T_152)) begin
          if (!(_T_156)) begin
            if (_T_159) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (_T_149) begin
        if (io_xfer_valid) begin
          enable <= 1'h1;
        end
      end else begin
        if (_T_152) begin
          if (_T_153) begin
            enable <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      awaddr <= 32'h0;
    end else begin
      if (_T_161) begin
        if (io_xfer_valid) begin
          awaddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      awvalid <= 1'h0;
    end else begin
      if (_T_161) begin
        if (io_xfer_valid) begin
          awvalid <= 1'h1;
        end
      end else begin
        if (_T_163) begin
          if (_T_164) begin
            awvalid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      bready <= 1'h0;
    end else begin
      if (!(_T_149)) begin
        if (_T_152) begin
          if (_T_153) begin
            bready <= 1'h1;
          end
        end else begin
          if (_T_156) begin
            if (_T_157) begin
              bready <= 1'h0;
            end
          end
        end
      end
    end
  end
endmodule
module CSRAXI_AXIL_AXIL( // @[:@346.2]
  output [31:0] io_csr_0_dataOut, // @[:@349.4]
  output        io_csr_0_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_0_dataIn, // @[:@349.4]
  input  [31:0] io_csr_1_dataIn, // @[:@349.4]
  output [31:0] io_csr_2_dataOut, // @[:@349.4]
  output        io_csr_2_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_2_dataIn, // @[:@349.4]
  output [31:0] io_csr_3_dataOut, // @[:@349.4]
  output        io_csr_3_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_3_dataIn, // @[:@349.4]
  output [31:0] io_csr_4_dataOut, // @[:@349.4]
  output        io_csr_4_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_4_dataIn, // @[:@349.4]
  output [31:0] io_csr_5_dataOut, // @[:@349.4]
  output        io_csr_5_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_5_dataIn, // @[:@349.4]
  output [31:0] io_csr_6_dataOut, // @[:@349.4]
  output        io_csr_6_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_6_dataIn, // @[:@349.4]
  output [31:0] io_csr_7_dataOut, // @[:@349.4]
  output        io_csr_7_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_7_dataIn, // @[:@349.4]
  output [31:0] io_csr_8_dataOut, // @[:@349.4]
  output        io_csr_8_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_8_dataIn, // @[:@349.4]
  output [31:0] io_csr_9_dataOut, // @[:@349.4]
  output        io_csr_9_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_9_dataIn, // @[:@349.4]
  output [31:0] io_csr_10_dataOut, // @[:@349.4]
  output        io_csr_10_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_10_dataIn, // @[:@349.4]
  output [31:0] io_csr_11_dataOut, // @[:@349.4]
  output        io_csr_11_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_11_dataIn, // @[:@349.4]
  input  [31:0] io_csr_12_dataIn, // @[:@349.4]
  input  [31:0] io_csr_13_dataIn, // @[:@349.4]
  output [31:0] io_csr_14_dataOut, // @[:@349.4]
  output        io_csr_14_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_14_dataIn, // @[:@349.4]
  output [31:0] io_csr_15_dataOut, // @[:@349.4]
  output        io_csr_15_dataWrite, // @[:@349.4]
  input  [31:0] io_csr_15_dataIn, // @[:@349.4]
  input  [3:0]  io_bus_addr, // @[:@349.4]
  input  [31:0] io_bus_dataOut, // @[:@349.4]
  output [31:0] io_bus_dataIn, // @[:@349.4]
  input         io_bus_write, // @[:@349.4]
  input         io_bus_read // @[:@349.4]
);
  wire  _T_178; // @[CSR.scala 32:22:@354.4]
  wire  _T_179; // @[CSR.scala 32:30:@355.4]
  wire [31:0] _GEN_0; // @[CSR.scala 32:45:@356.4]
  wire  _T_184; // @[CSR.scala 39:30:@364.4]
  wire  _T_189; // @[CSR.scala 32:22:@373.4]
  wire  _T_190; // @[CSR.scala 32:30:@374.4]
  wire [31:0] _GEN_4; // @[CSR.scala 32:45:@375.4]
  wire  _T_200; // @[CSR.scala 32:22:@392.4]
  wire  _T_201; // @[CSR.scala 32:30:@393.4]
  wire [31:0] _GEN_8; // @[CSR.scala 32:45:@394.4]
  wire  _T_206; // @[CSR.scala 39:30:@402.4]
  wire  _T_211; // @[CSR.scala 32:22:@411.4]
  wire  _T_212; // @[CSR.scala 32:30:@412.4]
  wire [31:0] _GEN_12; // @[CSR.scala 32:45:@413.4]
  wire  _T_217; // @[CSR.scala 39:30:@421.4]
  wire  _T_222; // @[CSR.scala 32:22:@430.4]
  wire  _T_223; // @[CSR.scala 32:30:@431.4]
  wire [31:0] _GEN_16; // @[CSR.scala 32:45:@432.4]
  wire  _T_228; // @[CSR.scala 39:30:@440.4]
  wire  _T_233; // @[CSR.scala 32:22:@449.4]
  wire  _T_234; // @[CSR.scala 32:30:@450.4]
  wire [31:0] _GEN_20; // @[CSR.scala 32:45:@451.4]
  wire  _T_239; // @[CSR.scala 39:30:@459.4]
  wire  _T_244; // @[CSR.scala 32:22:@468.4]
  wire  _T_245; // @[CSR.scala 32:30:@469.4]
  wire [31:0] _GEN_24; // @[CSR.scala 32:45:@470.4]
  wire  _T_250; // @[CSR.scala 39:30:@478.4]
  wire  _T_255; // @[CSR.scala 32:22:@487.4]
  wire  _T_256; // @[CSR.scala 32:30:@488.4]
  wire [31:0] _GEN_28; // @[CSR.scala 32:45:@489.4]
  wire  _T_261; // @[CSR.scala 39:30:@497.4]
  wire  _T_266; // @[CSR.scala 32:22:@506.4]
  wire  _T_267; // @[CSR.scala 32:30:@507.4]
  wire [31:0] _GEN_32; // @[CSR.scala 32:45:@508.4]
  wire  _T_272; // @[CSR.scala 39:30:@516.4]
  wire  _T_277; // @[CSR.scala 32:22:@525.4]
  wire  _T_278; // @[CSR.scala 32:30:@526.4]
  wire [31:0] _GEN_36; // @[CSR.scala 32:45:@527.4]
  wire  _T_283; // @[CSR.scala 39:30:@535.4]
  wire  _T_288; // @[CSR.scala 32:22:@544.4]
  wire  _T_289; // @[CSR.scala 32:30:@545.4]
  wire [31:0] _GEN_40; // @[CSR.scala 32:45:@546.4]
  wire  _T_294; // @[CSR.scala 39:30:@554.4]
  wire  _T_299; // @[CSR.scala 32:22:@563.4]
  wire  _T_300; // @[CSR.scala 32:30:@564.4]
  wire [31:0] _GEN_44; // @[CSR.scala 32:45:@565.4]
  wire  _T_305; // @[CSR.scala 39:30:@573.4]
  wire  _T_310; // @[CSR.scala 32:22:@582.4]
  wire  _T_311; // @[CSR.scala 32:30:@583.4]
  wire [31:0] _GEN_48; // @[CSR.scala 32:45:@584.4]
  wire  _T_321; // @[CSR.scala 32:22:@601.4]
  wire  _T_322; // @[CSR.scala 32:30:@602.4]
  wire [31:0] _GEN_52; // @[CSR.scala 32:45:@603.4]
  wire  _T_332; // @[CSR.scala 32:22:@620.4]
  wire  _T_333; // @[CSR.scala 32:30:@621.4]
  wire [31:0] _GEN_56; // @[CSR.scala 32:45:@622.4]
  wire  _T_338; // @[CSR.scala 39:30:@630.4]
  wire  _T_343; // @[CSR.scala 32:22:@639.4]
  wire  _T_344; // @[CSR.scala 32:30:@640.4]
  wire  _T_349; // @[CSR.scala 39:30:@649.4]
  assign _T_178 = io_bus_addr == 4'h0; // @[CSR.scala 32:22:@354.4]
  assign _T_179 = _T_178 & io_bus_read; // @[CSR.scala 32:30:@355.4]
  assign _GEN_0 = _T_179 ? io_csr_0_dataIn : 32'h0; // @[CSR.scala 32:45:@356.4]
  assign _T_184 = _T_178 & io_bus_write; // @[CSR.scala 39:30:@364.4]
  assign _T_189 = io_bus_addr == 4'h1; // @[CSR.scala 32:22:@373.4]
  assign _T_190 = _T_189 & io_bus_read; // @[CSR.scala 32:30:@374.4]
  assign _GEN_4 = _T_190 ? io_csr_1_dataIn : _GEN_0; // @[CSR.scala 32:45:@375.4]
  assign _T_200 = io_bus_addr == 4'h2; // @[CSR.scala 32:22:@392.4]
  assign _T_201 = _T_200 & io_bus_read; // @[CSR.scala 32:30:@393.4]
  assign _GEN_8 = _T_201 ? io_csr_2_dataIn : _GEN_4; // @[CSR.scala 32:45:@394.4]
  assign _T_206 = _T_200 & io_bus_write; // @[CSR.scala 39:30:@402.4]
  assign _T_211 = io_bus_addr == 4'h3; // @[CSR.scala 32:22:@411.4]
  assign _T_212 = _T_211 & io_bus_read; // @[CSR.scala 32:30:@412.4]
  assign _GEN_12 = _T_212 ? io_csr_3_dataIn : _GEN_8; // @[CSR.scala 32:45:@413.4]
  assign _T_217 = _T_211 & io_bus_write; // @[CSR.scala 39:30:@421.4]
  assign _T_222 = io_bus_addr == 4'h4; // @[CSR.scala 32:22:@430.4]
  assign _T_223 = _T_222 & io_bus_read; // @[CSR.scala 32:30:@431.4]
  assign _GEN_16 = _T_223 ? io_csr_4_dataIn : _GEN_12; // @[CSR.scala 32:45:@432.4]
  assign _T_228 = _T_222 & io_bus_write; // @[CSR.scala 39:30:@440.4]
  assign _T_233 = io_bus_addr == 4'h5; // @[CSR.scala 32:22:@449.4]
  assign _T_234 = _T_233 & io_bus_read; // @[CSR.scala 32:30:@450.4]
  assign _GEN_20 = _T_234 ? io_csr_5_dataIn : _GEN_16; // @[CSR.scala 32:45:@451.4]
  assign _T_239 = _T_233 & io_bus_write; // @[CSR.scala 39:30:@459.4]
  assign _T_244 = io_bus_addr == 4'h6; // @[CSR.scala 32:22:@468.4]
  assign _T_245 = _T_244 & io_bus_read; // @[CSR.scala 32:30:@469.4]
  assign _GEN_24 = _T_245 ? io_csr_6_dataIn : _GEN_20; // @[CSR.scala 32:45:@470.4]
  assign _T_250 = _T_244 & io_bus_write; // @[CSR.scala 39:30:@478.4]
  assign _T_255 = io_bus_addr == 4'h7; // @[CSR.scala 32:22:@487.4]
  assign _T_256 = _T_255 & io_bus_read; // @[CSR.scala 32:30:@488.4]
  assign _GEN_28 = _T_256 ? io_csr_7_dataIn : _GEN_24; // @[CSR.scala 32:45:@489.4]
  assign _T_261 = _T_255 & io_bus_write; // @[CSR.scala 39:30:@497.4]
  assign _T_266 = io_bus_addr == 4'h8; // @[CSR.scala 32:22:@506.4]
  assign _T_267 = _T_266 & io_bus_read; // @[CSR.scala 32:30:@507.4]
  assign _GEN_32 = _T_267 ? io_csr_8_dataIn : _GEN_28; // @[CSR.scala 32:45:@508.4]
  assign _T_272 = _T_266 & io_bus_write; // @[CSR.scala 39:30:@516.4]
  assign _T_277 = io_bus_addr == 4'h9; // @[CSR.scala 32:22:@525.4]
  assign _T_278 = _T_277 & io_bus_read; // @[CSR.scala 32:30:@526.4]
  assign _GEN_36 = _T_278 ? io_csr_9_dataIn : _GEN_32; // @[CSR.scala 32:45:@527.4]
  assign _T_283 = _T_277 & io_bus_write; // @[CSR.scala 39:30:@535.4]
  assign _T_288 = io_bus_addr == 4'ha; // @[CSR.scala 32:22:@544.4]
  assign _T_289 = _T_288 & io_bus_read; // @[CSR.scala 32:30:@545.4]
  assign _GEN_40 = _T_289 ? io_csr_10_dataIn : _GEN_36; // @[CSR.scala 32:45:@546.4]
  assign _T_294 = _T_288 & io_bus_write; // @[CSR.scala 39:30:@554.4]
  assign _T_299 = io_bus_addr == 4'hb; // @[CSR.scala 32:22:@563.4]
  assign _T_300 = _T_299 & io_bus_read; // @[CSR.scala 32:30:@564.4]
  assign _GEN_44 = _T_300 ? io_csr_11_dataIn : _GEN_40; // @[CSR.scala 32:45:@565.4]
  assign _T_305 = _T_299 & io_bus_write; // @[CSR.scala 39:30:@573.4]
  assign _T_310 = io_bus_addr == 4'hc; // @[CSR.scala 32:22:@582.4]
  assign _T_311 = _T_310 & io_bus_read; // @[CSR.scala 32:30:@583.4]
  assign _GEN_48 = _T_311 ? io_csr_12_dataIn : _GEN_44; // @[CSR.scala 32:45:@584.4]
  assign _T_321 = io_bus_addr == 4'hd; // @[CSR.scala 32:22:@601.4]
  assign _T_322 = _T_321 & io_bus_read; // @[CSR.scala 32:30:@602.4]
  assign _GEN_52 = _T_322 ? io_csr_13_dataIn : _GEN_48; // @[CSR.scala 32:45:@603.4]
  assign _T_332 = io_bus_addr == 4'he; // @[CSR.scala 32:22:@620.4]
  assign _T_333 = _T_332 & io_bus_read; // @[CSR.scala 32:30:@621.4]
  assign _GEN_56 = _T_333 ? io_csr_14_dataIn : _GEN_52; // @[CSR.scala 32:45:@622.4]
  assign _T_338 = _T_332 & io_bus_write; // @[CSR.scala 39:30:@630.4]
  assign _T_343 = io_bus_addr == 4'hf; // @[CSR.scala 32:22:@639.4]
  assign _T_344 = _T_343 & io_bus_read; // @[CSR.scala 32:30:@640.4]
  assign _T_349 = _T_343 & io_bus_write; // @[CSR.scala 39:30:@649.4]
  assign io_csr_0_dataOut = _T_184 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@366.6 CSR.scala 44:25:@371.6]
  assign io_csr_0_dataWrite = _T_178 & io_bus_write; // @[CSR.scala 41:27:@367.6 CSR.scala 43:27:@370.6]
  assign io_csr_2_dataOut = _T_206 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@404.6 CSR.scala 44:25:@409.6]
  assign io_csr_2_dataWrite = _T_200 & io_bus_write; // @[CSR.scala 41:27:@405.6 CSR.scala 43:27:@408.6]
  assign io_csr_3_dataOut = _T_217 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@423.6 CSR.scala 44:25:@428.6]
  assign io_csr_3_dataWrite = _T_211 & io_bus_write; // @[CSR.scala 41:27:@424.6 CSR.scala 43:27:@427.6]
  assign io_csr_4_dataOut = _T_228 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@442.6 CSR.scala 44:25:@447.6]
  assign io_csr_4_dataWrite = _T_222 & io_bus_write; // @[CSR.scala 41:27:@443.6 CSR.scala 43:27:@446.6]
  assign io_csr_5_dataOut = _T_239 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@461.6 CSR.scala 44:25:@466.6]
  assign io_csr_5_dataWrite = _T_233 & io_bus_write; // @[CSR.scala 41:27:@462.6 CSR.scala 43:27:@465.6]
  assign io_csr_6_dataOut = _T_250 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@480.6 CSR.scala 44:25:@485.6]
  assign io_csr_6_dataWrite = _T_244 & io_bus_write; // @[CSR.scala 41:27:@481.6 CSR.scala 43:27:@484.6]
  assign io_csr_7_dataOut = _T_261 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@499.6 CSR.scala 44:25:@504.6]
  assign io_csr_7_dataWrite = _T_255 & io_bus_write; // @[CSR.scala 41:27:@500.6 CSR.scala 43:27:@503.6]
  assign io_csr_8_dataOut = _T_272 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@518.6 CSR.scala 44:25:@523.6]
  assign io_csr_8_dataWrite = _T_266 & io_bus_write; // @[CSR.scala 41:27:@519.6 CSR.scala 43:27:@522.6]
  assign io_csr_9_dataOut = _T_283 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@537.6 CSR.scala 44:25:@542.6]
  assign io_csr_9_dataWrite = _T_277 & io_bus_write; // @[CSR.scala 41:27:@538.6 CSR.scala 43:27:@541.6]
  assign io_csr_10_dataOut = _T_294 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@556.6 CSR.scala 44:25:@561.6]
  assign io_csr_10_dataWrite = _T_288 & io_bus_write; // @[CSR.scala 41:27:@557.6 CSR.scala 43:27:@560.6]
  assign io_csr_11_dataOut = _T_305 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@575.6 CSR.scala 44:25:@580.6]
  assign io_csr_11_dataWrite = _T_299 & io_bus_write; // @[CSR.scala 41:27:@576.6 CSR.scala 43:27:@579.6]
  assign io_csr_14_dataOut = _T_338 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@632.6 CSR.scala 44:25:@637.6]
  assign io_csr_14_dataWrite = _T_332 & io_bus_write; // @[CSR.scala 41:27:@633.6 CSR.scala 43:27:@636.6]
  assign io_csr_15_dataOut = _T_349 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@651.6 CSR.scala 44:25:@656.6]
  assign io_csr_15_dataWrite = _T_343 & io_bus_write; // @[CSR.scala 41:27:@652.6 CSR.scala 43:27:@655.6]
  assign io_bus_dataIn = _T_344 ? io_csr_15_dataIn : _GEN_56; // @[CSR.scala 29:17:@353.4]
endmodule
module AddressGeneratorAXI_AXIL_AXIL( // @[:@659.2]
  input         clock, // @[:@660.4]
  input         reset, // @[:@661.4]
  input         io_ctl_start, // @[:@662.4]
  output        io_ctl_busy, // @[:@662.4]
  input  [31:0] io_ctl_startAddress, // @[:@662.4]
  input  [31:0] io_ctl_lineLength, // @[:@662.4]
  input  [31:0] io_ctl_lineCount, // @[:@662.4]
  input  [31:0] io_ctl_lineGap, // @[:@662.4]
  input         io_xfer_done, // @[:@662.4]
  output [31:0] io_xfer_address, // @[:@662.4]
  output [31:0] io_xfer_length, // @[:@662.4]
  output        io_xfer_valid // @[:@662.4]
);
  reg [1:0] state; // @[AddressGenerator.scala 29:22:@664.4]
  reg [31:0] _RAND_0;
  reg [31:0] lineCount; // @[AddressGenerator.scala 31:26:@665.4]
  reg [31:0] _RAND_1;
  reg [31:0] lineGap; // @[AddressGenerator.scala 32:24:@666.4]
  reg [31:0] _RAND_2;
  reg [31:0] address_o; // @[AddressGenerator.scala 34:26:@667.4]
  reg [31:0] _RAND_3;
  reg [31:0] address_i; // @[AddressGenerator.scala 35:26:@668.4]
  reg [31:0] _RAND_4;
  reg [31:0] length_o; // @[AddressGenerator.scala 36:25:@669.4]
  reg [31:0] _RAND_5;
  reg [31:0] length_i; // @[AddressGenerator.scala 37:25:@670.4]
  reg [31:0] _RAND_6;
  reg  valid; // @[AddressGenerator.scala 38:22:@671.4]
  reg [31:0] _RAND_7;
  reg  busy; // @[AddressGenerator.scala 40:21:@673.4]
  reg [31:0] _RAND_8;
  wire  _T_46; // @[AddressGenerator.scala 48:14:@679.4]
  wire  _GEN_0; // @[AddressGenerator.scala 48:24:@680.4]
  wire  _T_49; // @[Conditional.scala 37:30:@686.4]
  wire [1:0] _GEN_1; // @[AddressGenerator.scala 56:25:@688.6]
  wire [31:0] _GEN_2; // @[AddressGenerator.scala 56:25:@688.6]
  wire [31:0] _GEN_3; // @[AddressGenerator.scala 56:25:@688.6]
  wire [31:0] _GEN_4; // @[AddressGenerator.scala 56:25:@688.6]
  wire [31:0] _GEN_5; // @[AddressGenerator.scala 56:25:@688.6]
  wire  _T_51; // @[Conditional.scala 37:30:@698.6]
  wire [34:0] _T_54; // @[AddressGenerator.scala 71:42:@703.8]
  wire [34:0] _GEN_28; // @[AddressGenerator.scala 71:30:@704.8]
  wire [35:0] _T_55; // @[AddressGenerator.scala 71:30:@704.8]
  wire [34:0] _T_56; // @[AddressGenerator.scala 71:30:@705.8]
  wire [34:0] _T_58; // @[AddressGenerator.scala 71:74:@706.8]
  wire [35:0] _T_59; // @[AddressGenerator.scala 71:63:@707.8]
  wire [34:0] _T_60; // @[AddressGenerator.scala 71:63:@708.8]
  wire [32:0] _T_62; // @[AddressGenerator.scala 73:30:@710.8]
  wire [32:0] _T_63; // @[AddressGenerator.scala 73:30:@711.8]
  wire [31:0] _T_64; // @[AddressGenerator.scala 73:30:@712.8]
  wire  _T_65; // @[Conditional.scala 37:30:@717.8]
  wire  _T_69; // @[AddressGenerator.scala 80:24:@722.12]
  wire [1:0] _GEN_7; // @[AddressGenerator.scala 80:30:@723.12]
  wire [1:0] _GEN_8; // @[AddressGenerator.scala 79:25:@721.10]
  wire  _GEN_9; // @[Conditional.scala 39:67:@718.8]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@718.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@699.6]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@699.6]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@699.6]
  wire [34:0] _GEN_15; // @[Conditional.scala 39:67:@699.6]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@699.6]
  wire [1:0] _GEN_17; // @[Conditional.scala 39:67:@699.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 40:58:@687.4]
  wire [34:0] _GEN_20; // @[Conditional.scala 40:58:@687.4]
  wire [31:0] _GEN_21; // @[Conditional.scala 40:58:@687.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@687.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@687.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@687.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@687.4]
  wire [31:0] _GEN_27; // @[Conditional.scala 40:58:@687.4]
  assign _T_46 = state == 2'h0; // @[AddressGenerator.scala 48:14:@679.4]
  assign _GEN_0 = _T_46 ? 1'h0 : 1'h1; // @[AddressGenerator.scala 48:24:@680.4]
  assign _T_49 = 2'h0 == state; // @[Conditional.scala 37:30:@686.4]
  assign _GEN_1 = io_ctl_start ? 2'h1 : state; // @[AddressGenerator.scala 56:25:@688.6]
  assign _GEN_2 = io_ctl_start ? io_ctl_startAddress : address_i; // @[AddressGenerator.scala 56:25:@688.6]
  assign _GEN_3 = io_ctl_start ? io_ctl_lineLength : length_i; // @[AddressGenerator.scala 56:25:@688.6]
  assign _GEN_4 = io_ctl_start ? io_ctl_lineCount : lineCount; // @[AddressGenerator.scala 56:25:@688.6]
  assign _GEN_5 = io_ctl_start ? io_ctl_lineGap : lineGap; // @[AddressGenerator.scala 56:25:@688.6]
  assign _T_51 = 2'h1 == state; // @[Conditional.scala 37:30:@698.6]
  assign _T_54 = length_i * 32'h4; // @[AddressGenerator.scala 71:42:@703.8]
  assign _GEN_28 = {{3'd0}, address_i}; // @[AddressGenerator.scala 71:30:@704.8]
  assign _T_55 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@704.8]
  assign _T_56 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@705.8]
  assign _T_58 = lineGap * 32'h4; // @[AddressGenerator.scala 71:74:@706.8]
  assign _T_59 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@707.8]
  assign _T_60 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@708.8]
  assign _T_62 = lineCount - 32'h1; // @[AddressGenerator.scala 73:30:@710.8]
  assign _T_63 = $unsigned(_T_62); // @[AddressGenerator.scala 73:30:@711.8]
  assign _T_64 = _T_63[31:0]; // @[AddressGenerator.scala 73:30:@712.8]
  assign _T_65 = 2'h2 == state; // @[Conditional.scala 37:30:@717.8]
  assign _T_69 = lineCount > 32'h0; // @[AddressGenerator.scala 80:24:@722.12]
  assign _GEN_7 = _T_69 ? 2'h1 : 2'h0; // @[AddressGenerator.scala 80:30:@723.12]
  assign _GEN_8 = io_xfer_done ? _GEN_7 : state; // @[AddressGenerator.scala 79:25:@721.10]
  assign _GEN_9 = _T_65 ? 1'h0 : valid; // @[Conditional.scala 39:67:@718.8]
  assign _GEN_11 = _T_65 ? _GEN_8 : state; // @[Conditional.scala 39:67:@718.8]
  assign _GEN_12 = _T_51 ? 1'h1 : _GEN_9; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_13 = _T_51 ? address_i : address_o; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_14 = _T_51 ? length_i : length_o; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_15 = _T_51 ? _T_60 : {{3'd0}, address_i}; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_16 = _T_51 ? _T_64 : lineCount; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_17 = _T_51 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67:@699.6]
  assign _GEN_19 = _T_49 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_20 = _T_49 ? {{3'd0}, _GEN_2} : _GEN_15; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_21 = _T_49 ? _GEN_3 : length_i; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_22 = _T_49 ? _GEN_4 : _GEN_16; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_23 = _T_49 ? _GEN_5 : lineGap; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_25 = _T_49 ? valid : _GEN_12; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_26 = _T_49 ? address_o : _GEN_13; // @[Conditional.scala 40:58:@687.4]
  assign _GEN_27 = _T_49 ? length_o : _GEN_14; // @[Conditional.scala 40:58:@687.4]
  assign io_ctl_busy = busy; // @[AddressGenerator.scala 46:15:@678.4]
  assign io_xfer_address = address_o; // @[AddressGenerator.scala 42:19:@674.4]
  assign io_xfer_length = length_o; // @[AddressGenerator.scala 43:18:@675.4]
  assign io_xfer_valid = valid; // @[AddressGenerator.scala 44:17:@676.4]
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
module TransferSplitterAXI_AXIL_AXIL( // @[:@732.2]
  input         clock, // @[:@733.4]
  input         reset, // @[:@734.4]
  output        io_xferIn_done, // @[:@735.4]
  input  [31:0] io_xferIn_address, // @[:@735.4]
  input  [31:0] io_xferIn_length, // @[:@735.4]
  input         io_xferIn_valid, // @[:@735.4]
  input         io_xferOut_done, // @[:@735.4]
  output [31:0] io_xferOut_address, // @[:@735.4]
  output [31:0] io_xferOut_length, // @[:@735.4]
  output        io_xferOut_valid // @[:@735.4]
);
  reg [31:0] _T_42; // @[TransferSplitter.scala 35:28:@737.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_45; // @[TransferSplitter.scala 36:27:@738.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_48; // @[TransferSplitter.scala 38:28:@739.4]
  reg [31:0] _RAND_2;
  reg [31:0] _T_51; // @[TransferSplitter.scala 39:27:@740.4]
  reg [31:0] _RAND_3;
  reg  _T_60; // @[TransferSplitter.scala 44:23:@743.4]
  reg [31:0] _RAND_4;
  reg  _T_63; // @[TransferSplitter.scala 45:24:@744.4]
  reg [31:0] _RAND_5;
  reg [1:0] _T_65; // @[TransferSplitter.scala 47:24:@745.4]
  reg [31:0] _RAND_6;
  wire  _T_66; // @[Conditional.scala 37:30:@751.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 60:31:@754.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 60:31:@754.6]
  wire [1:0] _GEN_3; // @[TransferSplitter.scala 60:31:@754.6]
  wire  _T_68; // @[Conditional.scala 37:30:@762.6]
  wire  _T_71; // @[TransferSplitter.scala 73:23:@768.8]
  wire [32:0] _T_74; // @[TransferSplitter.scala 76:34:@771.10]
  wire [32:0] _T_75; // @[TransferSplitter.scala 76:34:@772.10]
  wire [31:0] _T_76; // @[TransferSplitter.scala 76:34:@773.10]
  wire [11:0] _T_79; // @[TransferSplitter.scala 77:50:@775.10]
  wire [31:0] _GEN_33; // @[TransferSplitter.scala 77:36:@776.10]
  wire [32:0] _T_80; // @[TransferSplitter.scala 77:36:@776.10]
  wire [31:0] _T_81; // @[TransferSplitter.scala 77:36:@777.10]
  wire [34:0] _T_84; // @[TransferSplitter.scala 95:47:@783.10]
  wire [34:0] _GEN_34; // @[TransferSplitter.scala 95:36:@784.10]
  wire [35:0] _T_85; // @[TransferSplitter.scala 95:36:@784.10]
  wire [34:0] _T_86; // @[TransferSplitter.scala 95:36:@785.10]
  wire [31:0] _GEN_4; // @[TransferSplitter.scala 73:38:@769.8]
  wire [31:0] _GEN_5; // @[TransferSplitter.scala 73:38:@769.8]
  wire [34:0] _GEN_6; // @[TransferSplitter.scala 73:38:@769.8]
  wire  _T_87; // @[Conditional.scala 37:30:@790.8]
  wire  _T_91; // @[TransferSplitter.scala 114:25:@795.12]
  wire [1:0] _GEN_7; // @[TransferSplitter.scala 114:32:@796.12]
  wire  _GEN_8; // @[TransferSplitter.scala 114:32:@796.12]
  wire [1:0] _GEN_9; // @[TransferSplitter.scala 113:31:@794.10]
  wire  _GEN_10; // @[TransferSplitter.scala 113:31:@794.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@791.8]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@791.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@791.8]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@763.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@763.6]
  wire [1:0] _GEN_18; // @[Conditional.scala 39:67:@763.6]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@763.6]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@763.6]
  wire [34:0] _GEN_21; // @[Conditional.scala 39:67:@763.6]
  wire  _GEN_23; // @[Conditional.scala 39:67:@763.6]
  wire  _GEN_24; // @[Conditional.scala 40:58:@752.4]
  wire [34:0] _GEN_25; // @[Conditional.scala 40:58:@752.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@752.4]
  wire [1:0] _GEN_28; // @[Conditional.scala 40:58:@752.4]
  wire [31:0] _GEN_29; // @[Conditional.scala 40:58:@752.4]
  wire  _GEN_31; // @[Conditional.scala 40:58:@752.4]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58:@752.4]
  assign _T_66 = 2'h0 == _T_65; // @[Conditional.scala 37:30:@751.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_42; // @[TransferSplitter.scala 60:31:@754.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_45; // @[TransferSplitter.scala 60:31:@754.6]
  assign _GEN_3 = io_xferIn_valid ? 2'h1 : _T_65; // @[TransferSplitter.scala 60:31:@754.6]
  assign _T_68 = 2'h1 == _T_65; // @[Conditional.scala 37:30:@762.6]
  assign _T_71 = _T_45 > 32'h100; // @[TransferSplitter.scala 73:23:@768.8]
  assign _T_74 = _T_45 - 32'h100; // @[TransferSplitter.scala 76:34:@771.10]
  assign _T_75 = $unsigned(_T_74); // @[TransferSplitter.scala 76:34:@772.10]
  assign _T_76 = _T_75[31:0]; // @[TransferSplitter.scala 76:34:@773.10]
  assign _T_79 = 9'h100 * 9'h4; // @[TransferSplitter.scala 77:50:@775.10]
  assign _GEN_33 = {{20'd0}, _T_79}; // @[TransferSplitter.scala 77:36:@776.10]
  assign _T_80 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@776.10]
  assign _T_81 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@777.10]
  assign _T_84 = _T_45 * 32'h4; // @[TransferSplitter.scala 95:47:@783.10]
  assign _GEN_34 = {{3'd0}, _T_42}; // @[TransferSplitter.scala 95:36:@784.10]
  assign _T_85 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@784.10]
  assign _T_86 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@785.10]
  assign _GEN_4 = _T_71 ? 32'h100 : _T_45; // @[TransferSplitter.scala 73:38:@769.8]
  assign _GEN_5 = _T_71 ? _T_76 : 32'h0; // @[TransferSplitter.scala 73:38:@769.8]
  assign _GEN_6 = _T_71 ? {{3'd0}, _T_81} : _T_86; // @[TransferSplitter.scala 73:38:@769.8]
  assign _T_87 = 2'h2 == _T_65; // @[Conditional.scala 37:30:@790.8]
  assign _T_91 = _T_45 > 32'h0; // @[TransferSplitter.scala 114:25:@795.12]
  assign _GEN_7 = _T_91 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 114:32:@796.12]
  assign _GEN_8 = _T_91 ? _T_60 : 1'h1; // @[TransferSplitter.scala 114:32:@796.12]
  assign _GEN_9 = io_xferOut_done ? _GEN_7 : _T_65; // @[TransferSplitter.scala 113:31:@794.10]
  assign _GEN_10 = io_xferOut_done ? _GEN_8 : _T_60; // @[TransferSplitter.scala 113:31:@794.10]
  assign _GEN_11 = _T_87 ? 1'h0 : _T_63; // @[Conditional.scala 39:67:@791.8]
  assign _GEN_13 = _T_87 ? _GEN_9 : _T_65; // @[Conditional.scala 39:67:@791.8]
  assign _GEN_14 = _T_87 ? _GEN_10 : _T_60; // @[Conditional.scala 39:67:@791.8]
  assign _GEN_15 = _T_68 ? _T_42 : _T_48; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_17 = _T_68 ? 1'h1 : _GEN_11; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_18 = _T_68 ? 2'h2 : _GEN_13; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_19 = _T_68 ? _GEN_4 : _T_51; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_20 = _T_68 ? _GEN_5 : _T_45; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_21 = _T_68 ? _GEN_6 : {{3'd0}, _T_42}; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_23 = _T_68 ? _T_60 : _GEN_14; // @[Conditional.scala 39:67:@763.6]
  assign _GEN_24 = _T_66 ? 1'h0 : _GEN_23; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_25 = _T_66 ? {{3'd0}, _GEN_0} : _GEN_21; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_26 = _T_66 ? _GEN_1 : _GEN_20; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_28 = _T_66 ? _GEN_3 : _GEN_18; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_29 = _T_66 ? _T_48 : _GEN_15; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_31 = _T_66 ? _T_63 : _GEN_17; // @[Conditional.scala 40:58:@752.4]
  assign _GEN_32 = _T_66 ? _T_51 : _GEN_19; // @[Conditional.scala 40:58:@752.4]
  assign io_xferIn_done = _T_60; // @[TransferSplitter.scala 49:20:@746.4]
  assign io_xferOut_address = _T_48; // @[TransferSplitter.scala 53:24:@749.4]
  assign io_xferOut_length = _T_51; // @[TransferSplitter.scala 54:23:@750.4]
  assign io_xferOut_valid = _T_63; // @[TransferSplitter.scala 50:22:@747.4]
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
module TransferSplitterAXI_AXIL_AXIL_1( // @[:@879.2]
  input         clock, // @[:@880.4]
  input         reset, // @[:@881.4]
  output        io_xferIn_done, // @[:@882.4]
  input  [31:0] io_xferIn_address, // @[:@882.4]
  input  [31:0] io_xferIn_length, // @[:@882.4]
  input         io_xferIn_valid, // @[:@882.4]
  input         io_xferOut_done, // @[:@882.4]
  output [31:0] io_xferOut_address, // @[:@882.4]
  output        io_xferOut_valid // @[:@882.4]
);
  reg [31:0] _T_42; // @[TransferSplitter.scala 35:28:@884.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_45; // @[TransferSplitter.scala 36:27:@885.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_48; // @[TransferSplitter.scala 38:28:@886.4]
  reg [31:0] _RAND_2;
  reg  _T_60; // @[TransferSplitter.scala 44:23:@890.4]
  reg [31:0] _RAND_3;
  reg  _T_63; // @[TransferSplitter.scala 45:24:@891.4]
  reg [31:0] _RAND_4;
  reg [1:0] _T_65; // @[TransferSplitter.scala 47:24:@892.4]
  reg [31:0] _RAND_5;
  wire  _T_66; // @[Conditional.scala 37:30:@898.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 60:31:@901.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 60:31:@901.6]
  wire [1:0] _GEN_3; // @[TransferSplitter.scala 60:31:@901.6]
  wire  _T_68; // @[Conditional.scala 37:30:@909.6]
  wire  _T_71; // @[TransferSplitter.scala 73:23:@915.8]
  wire [31:0] _GEN_2; // @[TransferSplitter.scala 79:61:@917.10]
  wire [12:0] _T_74; // @[TransferSplitter.scala 79:61:@917.10]
  wire [13:0] _T_75; // @[TransferSplitter.scala 79:49:@918.10]
  wire [13:0] _T_76; // @[TransferSplitter.scala 79:49:@919.10]
  wire [12:0] _T_77; // @[TransferSplitter.scala 79:49:@920.10]
  wire [3:0] _T_80; // @[TransferSplitter.scala 80:47:@921.10]
  wire [12:0] _GEN_39; // @[TransferSplitter.scala 80:33:@922.10]
  wire  _T_81; // @[TransferSplitter.scala 80:33:@922.10]
  wire [12:0] _T_83; // @[TransferSplitter.scala 81:42:@924.12]
  wire [31:0] _GEN_40; // @[TransferSplitter.scala 82:36:@927.12]
  wire [32:0] _T_86; // @[TransferSplitter.scala 82:36:@927.12]
  wire [32:0] _T_87; // @[TransferSplitter.scala 82:36:@928.12]
  wire [31:0] _T_88; // @[TransferSplitter.scala 82:36:@929.12]
  wire [31:0] _GEN_41; // @[TransferSplitter.scala 83:38:@931.12]
  wire [32:0] _T_89; // @[TransferSplitter.scala 83:38:@931.12]
  wire [31:0] _T_90; // @[TransferSplitter.scala 83:38:@932.12]
  wire [32:0] _T_93; // @[TransferSplitter.scala 86:36:@937.12]
  wire [32:0] _T_94; // @[TransferSplitter.scala 86:36:@938.12]
  wire [31:0] _T_95; // @[TransferSplitter.scala 86:36:@939.12]
  wire [31:0] _GEN_42; // @[TransferSplitter.scala 87:38:@942.12]
  wire [32:0] _T_99; // @[TransferSplitter.scala 87:38:@942.12]
  wire [31:0] _T_100; // @[TransferSplitter.scala 87:38:@943.12]
  wire [31:0] _GEN_5; // @[TransferSplitter.scala 80:62:@923.10]
  wire [31:0] _GEN_6; // @[TransferSplitter.scala 80:62:@923.10]
  wire [34:0] _T_108; // @[TransferSplitter.scala 98:44:@952.10]
  wire [34:0] _GEN_43; // @[TransferSplitter.scala 98:33:@953.10]
  wire  _T_109; // @[TransferSplitter.scala 98:33:@953.10]
  wire [34:0] _GEN_46; // @[TransferSplitter.scala 105:38:@970.12]
  wire [35:0] _T_122; // @[TransferSplitter.scala 105:38:@970.12]
  wire [34:0] _T_123; // @[TransferSplitter.scala 105:38:@971.12]
  wire [31:0] _GEN_8; // @[TransferSplitter.scala 98:59:@954.10]
  wire [34:0] _GEN_9; // @[TransferSplitter.scala 98:59:@954.10]
  wire [31:0] _GEN_11; // @[TransferSplitter.scala 73:38:@916.8]
  wire [34:0] _GEN_12; // @[TransferSplitter.scala 73:38:@916.8]
  wire  _T_124; // @[Conditional.scala 37:30:@977.8]
  wire  _T_128; // @[TransferSplitter.scala 114:25:@982.12]
  wire [1:0] _GEN_13; // @[TransferSplitter.scala 114:32:@983.12]
  wire  _GEN_14; // @[TransferSplitter.scala 114:32:@983.12]
  wire [1:0] _GEN_15; // @[TransferSplitter.scala 113:31:@981.10]
  wire  _GEN_16; // @[TransferSplitter.scala 113:31:@981.10]
  wire  _GEN_17; // @[Conditional.scala 39:67:@978.8]
  wire [1:0] _GEN_19; // @[Conditional.scala 39:67:@978.8]
  wire  _GEN_20; // @[Conditional.scala 39:67:@978.8]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@910.6]
  wire  _GEN_23; // @[Conditional.scala 39:67:@910.6]
  wire [1:0] _GEN_24; // @[Conditional.scala 39:67:@910.6]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@910.6]
  wire [34:0] _GEN_27; // @[Conditional.scala 39:67:@910.6]
  wire  _GEN_29; // @[Conditional.scala 39:67:@910.6]
  wire  _GEN_30; // @[Conditional.scala 40:58:@899.4]
  wire [34:0] _GEN_31; // @[Conditional.scala 40:58:@899.4]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58:@899.4]
  wire [1:0] _GEN_34; // @[Conditional.scala 40:58:@899.4]
  wire [31:0] _GEN_35; // @[Conditional.scala 40:58:@899.4]
  wire  _GEN_37; // @[Conditional.scala 40:58:@899.4]
  assign _T_66 = 2'h0 == _T_65; // @[Conditional.scala 37:30:@898.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_42; // @[TransferSplitter.scala 60:31:@901.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_45; // @[TransferSplitter.scala 60:31:@901.6]
  assign _GEN_3 = io_xferIn_valid ? 2'h1 : _T_65; // @[TransferSplitter.scala 60:31:@901.6]
  assign _T_68 = 2'h1 == _T_65; // @[Conditional.scala 37:30:@909.6]
  assign _T_71 = _T_45 > 32'h1; // @[TransferSplitter.scala 73:23:@915.8]
  assign _GEN_2 = _T_42 % 32'h1000; // @[TransferSplitter.scala 79:61:@917.10]
  assign _T_74 = _GEN_2[12:0]; // @[TransferSplitter.scala 79:61:@917.10]
  assign _T_75 = 13'h1000 - _T_74; // @[TransferSplitter.scala 79:49:@918.10]
  assign _T_76 = $unsigned(_T_75); // @[TransferSplitter.scala 79:49:@919.10]
  assign _T_77 = _T_76[12:0]; // @[TransferSplitter.scala 79:49:@920.10]
  assign _T_80 = 3'h1 * 3'h4; // @[TransferSplitter.scala 80:47:@921.10]
  assign _GEN_39 = {{9'd0}, _T_80}; // @[TransferSplitter.scala 80:33:@922.10]
  assign _T_81 = _T_77 < _GEN_39; // @[TransferSplitter.scala 80:33:@922.10]
  assign _T_83 = _T_77 / 13'h4; // @[TransferSplitter.scala 81:42:@924.12]
  assign _GEN_40 = {{19'd0}, _T_83}; // @[TransferSplitter.scala 82:36:@927.12]
  assign _T_86 = _T_45 - _GEN_40; // @[TransferSplitter.scala 82:36:@927.12]
  assign _T_87 = $unsigned(_T_86); // @[TransferSplitter.scala 82:36:@928.12]
  assign _T_88 = _T_87[31:0]; // @[TransferSplitter.scala 82:36:@929.12]
  assign _GEN_41 = {{19'd0}, _T_77}; // @[TransferSplitter.scala 83:38:@931.12]
  assign _T_89 = _T_42 + _GEN_41; // @[TransferSplitter.scala 83:38:@931.12]
  assign _T_90 = _T_42 + _GEN_41; // @[TransferSplitter.scala 83:38:@932.12]
  assign _T_93 = _T_45 - 32'h1; // @[TransferSplitter.scala 86:36:@937.12]
  assign _T_94 = $unsigned(_T_93); // @[TransferSplitter.scala 86:36:@938.12]
  assign _T_95 = _T_94[31:0]; // @[TransferSplitter.scala 86:36:@939.12]
  assign _GEN_42 = {{28'd0}, _T_80}; // @[TransferSplitter.scala 87:38:@942.12]
  assign _T_99 = _T_42 + _GEN_42; // @[TransferSplitter.scala 87:38:@942.12]
  assign _T_100 = _T_42 + _GEN_42; // @[TransferSplitter.scala 87:38:@943.12]
  assign _GEN_5 = _T_81 ? _T_88 : _T_95; // @[TransferSplitter.scala 80:62:@923.10]
  assign _GEN_6 = _T_81 ? _T_90 : _T_100; // @[TransferSplitter.scala 80:62:@923.10]
  assign _T_108 = _T_45 * 32'h4; // @[TransferSplitter.scala 98:44:@952.10]
  assign _GEN_43 = {{22'd0}, _T_77}; // @[TransferSplitter.scala 98:33:@953.10]
  assign _T_109 = _GEN_43 < _T_108; // @[TransferSplitter.scala 98:33:@953.10]
  assign _GEN_46 = {{3'd0}, _T_42}; // @[TransferSplitter.scala 105:38:@970.12]
  assign _T_122 = _GEN_46 + _T_108; // @[TransferSplitter.scala 105:38:@970.12]
  assign _T_123 = _GEN_46 + _T_108; // @[TransferSplitter.scala 105:38:@971.12]
  assign _GEN_8 = _T_109 ? _T_88 : 32'h0; // @[TransferSplitter.scala 98:59:@954.10]
  assign _GEN_9 = _T_109 ? {{3'd0}, _T_90} : _T_123; // @[TransferSplitter.scala 98:59:@954.10]
  assign _GEN_11 = _T_71 ? _GEN_5 : _GEN_8; // @[TransferSplitter.scala 73:38:@916.8]
  assign _GEN_12 = _T_71 ? {{3'd0}, _GEN_6} : _GEN_9; // @[TransferSplitter.scala 73:38:@916.8]
  assign _T_124 = 2'h2 == _T_65; // @[Conditional.scala 37:30:@977.8]
  assign _T_128 = _T_45 > 32'h0; // @[TransferSplitter.scala 114:25:@982.12]
  assign _GEN_13 = _T_128 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 114:32:@983.12]
  assign _GEN_14 = _T_128 ? _T_60 : 1'h1; // @[TransferSplitter.scala 114:32:@983.12]
  assign _GEN_15 = io_xferOut_done ? _GEN_13 : _T_65; // @[TransferSplitter.scala 113:31:@981.10]
  assign _GEN_16 = io_xferOut_done ? _GEN_14 : _T_60; // @[TransferSplitter.scala 113:31:@981.10]
  assign _GEN_17 = _T_124 ? 1'h0 : _T_63; // @[Conditional.scala 39:67:@978.8]
  assign _GEN_19 = _T_124 ? _GEN_15 : _T_65; // @[Conditional.scala 39:67:@978.8]
  assign _GEN_20 = _T_124 ? _GEN_16 : _T_60; // @[Conditional.scala 39:67:@978.8]
  assign _GEN_21 = _T_68 ? _T_42 : _T_48; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_23 = _T_68 ? 1'h1 : _GEN_17; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_24 = _T_68 ? 2'h2 : _GEN_19; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_26 = _T_68 ? _GEN_11 : _T_45; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_27 = _T_68 ? _GEN_12 : {{3'd0}, _T_42}; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_29 = _T_68 ? _T_60 : _GEN_20; // @[Conditional.scala 39:67:@910.6]
  assign _GEN_30 = _T_66 ? 1'h0 : _GEN_29; // @[Conditional.scala 40:58:@899.4]
  assign _GEN_31 = _T_66 ? {{3'd0}, _GEN_0} : _GEN_27; // @[Conditional.scala 40:58:@899.4]
  assign _GEN_32 = _T_66 ? _GEN_1 : _GEN_26; // @[Conditional.scala 40:58:@899.4]
  assign _GEN_34 = _T_66 ? _GEN_3 : _GEN_24; // @[Conditional.scala 40:58:@899.4]
  assign _GEN_35 = _T_66 ? _T_48 : _GEN_21; // @[Conditional.scala 40:58:@899.4]
  assign _GEN_37 = _T_66 ? _T_63 : _GEN_23; // @[Conditional.scala 40:58:@899.4]
  assign io_xferIn_done = _T_60; // @[TransferSplitter.scala 49:20:@893.4]
  assign io_xferOut_address = _T_48; // @[TransferSplitter.scala 53:24:@896.4]
  assign io_xferOut_valid = _T_63; // @[TransferSplitter.scala 50:22:@894.4]
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
  _T_60 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_63 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_65 = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_42 <= 32'h0;
    end else begin
      _T_42 <= _GEN_31[31:0];
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
            if (_T_81) begin
              _T_45 <= _T_88;
            end else begin
              _T_45 <= _T_95;
            end
          end else begin
            if (_T_109) begin
              _T_45 <= _T_88;
            end else begin
              _T_45 <= 32'h0;
            end
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
      _T_60 <= 1'h0;
    end else begin
      if (_T_66) begin
        _T_60 <= 1'h0;
      end else begin
        if (!(_T_68)) begin
          if (_T_124) begin
            if (io_xferOut_done) begin
              if (!(_T_128)) begin
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
          if (_T_124) begin
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
          if (_T_124) begin
            if (io_xferOut_done) begin
              if (_T_128) begin
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
module ClearCSRAXI_AXIL_AXIL( // @[:@993.2]
  input         clock, // @[:@994.4]
  input         reset, // @[:@995.4]
  input  [31:0] io_csr_dataOut, // @[:@996.4]
  input         io_csr_dataWrite, // @[:@996.4]
  output [31:0] io_csr_dataIn, // @[:@996.4]
  output [31:0] io_value, // @[:@996.4]
  input  [31:0] io_clear // @[:@996.4]
);
  reg [31:0] reg$; // @[ClearCSR.scala 28:20:@998.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[ClearCSR.scala 36:19:@1005.6]
  wire [31:0] _T_30; // @[ClearCSR.scala 36:16:@1006.6]
  wire [31:0] _GEN_0; // @[ClearCSR.scala 33:25:@1001.4]
  assign _T_29 = ~ io_clear; // @[ClearCSR.scala 36:19:@1005.6]
  assign _T_30 = reg$ & _T_29; // @[ClearCSR.scala 36:16:@1006.6]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : _T_30; // @[ClearCSR.scala 33:25:@1001.4]
  assign io_csr_dataIn = reg$; // @[ClearCSR.scala 30:17:@999.4]
  assign io_value = reg$; // @[ClearCSR.scala 31:12:@1000.4]
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
module StatusCSRAXI_AXIL_AXIL( // @[:@1010.2]
  input         clock, // @[:@1011.4]
  output [31:0] io_csr_dataIn, // @[:@1013.4]
  input  [31:0] io_value // @[:@1013.4]
);
  reg [31:0] reg$; // @[StatusCSR.scala 27:20:@1015.4]
  reg [31:0] _RAND_0;
  assign io_csr_dataIn = reg$; // @[StatusCSR.scala 29:17:@1017.4]
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
module SimpleCSRAXI_AXIL_AXIL( // @[:@1019.2]
  input         clock, // @[:@1020.4]
  input         reset, // @[:@1021.4]
  input  [31:0] io_csr_dataOut, // @[:@1022.4]
  input         io_csr_dataWrite, // @[:@1022.4]
  output [31:0] io_csr_dataIn, // @[:@1022.4]
  output [31:0] io_value // @[:@1022.4]
);
  reg [31:0] reg$; // @[SimpleCSR.scala 27:20:@1024.4]
  reg [31:0] _RAND_0;
  wire [31:0] _GEN_0; // @[SimpleCSR.scala 32:25:@1027.4]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : reg$; // @[SimpleCSR.scala 32:25:@1027.4]
  assign io_csr_dataIn = reg$; // @[SimpleCSR.scala 29:17:@1025.4]
  assign io_value = reg$; // @[SimpleCSR.scala 30:12:@1026.4]
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
module SetCSRAXI_AXIL_AXIL( // @[:@1031.2]
  input         clock, // @[:@1032.4]
  input         reset, // @[:@1033.4]
  input  [31:0] io_csr_dataOut, // @[:@1034.4]
  input         io_csr_dataWrite, // @[:@1034.4]
  output [31:0] io_csr_dataIn, // @[:@1034.4]
  output [31:0] io_value, // @[:@1034.4]
  input  [31:0] io_set // @[:@1034.4]
);
  reg [31:0] reg$; // @[SetCSR.scala 28:20:@1036.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[SetCSR.scala 34:20:@1040.6]
  wire [31:0] _T_30; // @[SetCSR.scala 34:17:@1041.6]
  wire [31:0] _T_31; // @[SetCSR.scala 34:45:@1042.6]
  wire [31:0] _T_32; // @[SetCSR.scala 36:16:@1046.6]
  wire [31:0] _GEN_0; // @[SetCSR.scala 33:25:@1039.4]
  assign _T_29 = ~ io_csr_dataOut; // @[SetCSR.scala 34:20:@1040.6]
  assign _T_30 = reg$ & _T_29; // @[SetCSR.scala 34:17:@1041.6]
  assign _T_31 = _T_30 | io_set; // @[SetCSR.scala 34:45:@1042.6]
  assign _T_32 = reg$ | io_set; // @[SetCSR.scala 36:16:@1046.6]
  assign _GEN_0 = io_csr_dataWrite ? _T_31 : _T_32; // @[SetCSR.scala 33:25:@1039.4]
  assign io_csr_dataIn = reg$; // @[SetCSR.scala 30:17:@1037.4]
  assign io_value = reg$; // @[SetCSR.scala 31:12:@1038.4]
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
module InterruptControllerAXI_AXIL_AXIL( // @[:@1050.2]
  input         clock, // @[:@1051.4]
  input         reset, // @[:@1052.4]
  output        io_irq_readerDone, // @[:@1053.4]
  output        io_irq_writerDone, // @[:@1053.4]
  input         io_readBusy, // @[:@1053.4]
  input         io_writeBusy, // @[:@1053.4]
  input  [31:0] io_imr_dataOut, // @[:@1053.4]
  input         io_imr_dataWrite, // @[:@1053.4]
  output [31:0] io_imr_dataIn, // @[:@1053.4]
  input  [31:0] io_isr_dataOut, // @[:@1053.4]
  input         io_isr_dataWrite, // @[:@1053.4]
  output [31:0] io_isr_dataIn // @[:@1053.4]
);
  wire  SimpleCSRAXI_AXIL_AXIL_clock; // @[SimpleCSR.scala 40:21:@1055.4]
  wire  SimpleCSRAXI_AXIL_AXIL_reset; // @[SimpleCSR.scala 40:21:@1055.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1055.4]
  wire  SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1055.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1055.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_value; // @[SimpleCSR.scala 40:21:@1055.4]
  wire  SetCSRAXI_AXIL_AXIL_clock; // @[SetCSR.scala 43:21:@1087.4]
  wire  SetCSRAXI_AXIL_AXIL_reset; // @[SetCSR.scala 43:21:@1087.4]
  wire [31:0] SetCSRAXI_AXIL_AXIL_io_csr_dataOut; // @[SetCSR.scala 43:21:@1087.4]
  wire  SetCSRAXI_AXIL_AXIL_io_csr_dataWrite; // @[SetCSR.scala 43:21:@1087.4]
  wire [31:0] SetCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SetCSR.scala 43:21:@1087.4]
  wire [31:0] SetCSRAXI_AXIL_AXIL_io_value; // @[SetCSR.scala 43:21:@1087.4]
  wire [31:0] SetCSRAXI_AXIL_AXIL_io_set; // @[SetCSR.scala 43:21:@1087.4]
  reg  readBusy; // @[InterruptController.scala 33:25:@1064.4]
  reg [31:0] _RAND_0;
  reg  readBusyOld; // @[InterruptController.scala 34:28:@1066.4]
  reg [31:0] _RAND_1;
  reg  writeBusy; // @[InterruptController.scala 36:26:@1068.4]
  reg [31:0] _RAND_2;
  reg  writeBusyOld; // @[InterruptController.scala 37:29:@1070.4]
  reg [31:0] _RAND_3;
  reg  writeBusyIrq; // @[InterruptController.scala 39:29:@1072.4]
  reg [31:0] _RAND_4;
  reg  readBusyIrq; // @[InterruptController.scala 40:28:@1073.4]
  reg [31:0] _RAND_5;
  wire  _T_59; // @[InterruptController.scala 42:35:@1074.4]
  wire  _T_60; // @[InterruptController.scala 42:32:@1075.4]
  wire [31:0] mask; // @[:@1062.4 :@1063.4]
  wire  _T_61; // @[InterruptController.scala 42:53:@1076.4]
  wire  _T_62; // @[InterruptController.scala 42:46:@1077.4]
  wire  _T_64; // @[InterruptController.scala 43:33:@1079.4]
  wire  _T_65; // @[InterruptController.scala 43:30:@1080.4]
  wire  _T_66; // @[InterruptController.scala 43:50:@1081.4]
  wire  _T_67; // @[InterruptController.scala 43:43:@1082.4]
  wire [1:0] irq; // @[Cat.scala 30:58:@1084.4]
  wire [31:0] isr; // @[:@1095.4 :@1096.4]
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL ( // @[SimpleCSR.scala 40:21:@1055.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_io_value)
  );
  SetCSRAXI_AXIL_AXIL SetCSRAXI_AXIL_AXIL ( // @[SetCSR.scala 43:21:@1087.4]
    .clock(SetCSRAXI_AXIL_AXIL_clock),
    .reset(SetCSRAXI_AXIL_AXIL_reset),
    .io_csr_dataOut(SetCSRAXI_AXIL_AXIL_io_csr_dataOut),
    .io_csr_dataWrite(SetCSRAXI_AXIL_AXIL_io_csr_dataWrite),
    .io_csr_dataIn(SetCSRAXI_AXIL_AXIL_io_csr_dataIn),
    .io_value(SetCSRAXI_AXIL_AXIL_io_value),
    .io_set(SetCSRAXI_AXIL_AXIL_io_set)
  );
  assign _T_59 = writeBusy == 1'h0; // @[InterruptController.scala 42:35:@1074.4]
  assign _T_60 = writeBusyOld & _T_59; // @[InterruptController.scala 42:32:@1075.4]
  assign mask = SimpleCSRAXI_AXIL_AXIL_io_value; // @[:@1062.4 :@1063.4]
  assign _T_61 = mask[0]; // @[InterruptController.scala 42:53:@1076.4]
  assign _T_62 = _T_60 & _T_61; // @[InterruptController.scala 42:46:@1077.4]
  assign _T_64 = readBusy == 1'h0; // @[InterruptController.scala 43:33:@1079.4]
  assign _T_65 = readBusyOld & _T_64; // @[InterruptController.scala 43:30:@1080.4]
  assign _T_66 = mask[1]; // @[InterruptController.scala 43:50:@1081.4]
  assign _T_67 = _T_65 & _T_66; // @[InterruptController.scala 43:43:@1082.4]
  assign irq = {readBusyIrq,writeBusyIrq}; // @[Cat.scala 30:58:@1084.4]
  assign isr = SetCSRAXI_AXIL_AXIL_io_value; // @[:@1095.4 :@1096.4]
  assign io_irq_readerDone = isr[1]; // @[InterruptController.scala 50:21:@1100.4]
  assign io_irq_writerDone = isr[0]; // @[InterruptController.scala 49:21:@1098.4]
  assign io_imr_dataIn = SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1058.4]
  assign io_isr_dataIn = SetCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SetCSR.scala 47:16:@1091.4]
  assign SimpleCSRAXI_AXIL_AXIL_clock = clock; // @[:@1056.4]
  assign SimpleCSRAXI_AXIL_AXIL_reset = reset; // @[:@1057.4]
  assign SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut = io_imr_dataOut; // @[SimpleCSR.scala 42:16:@1060.4]
  assign SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite = io_imr_dataWrite; // @[SimpleCSR.scala 42:16:@1059.4]
  assign SetCSRAXI_AXIL_AXIL_clock = clock; // @[:@1088.4]
  assign SetCSRAXI_AXIL_AXIL_reset = reset; // @[:@1089.4]
  assign SetCSRAXI_AXIL_AXIL_io_csr_dataOut = io_isr_dataOut; // @[SetCSR.scala 47:16:@1093.4]
  assign SetCSRAXI_AXIL_AXIL_io_csr_dataWrite = io_isr_dataWrite; // @[SetCSR.scala 47:16:@1092.4]
  assign SetCSRAXI_AXIL_AXIL_io_set = {{30'd0}, irq}; // @[SetCSR.scala 45:16:@1090.4]
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
module WorkerCSRWrapperAXI_AXIL_AXIL( // @[:@1240.2]
  input         clock, // @[:@1241.4]
  input         reset, // @[:@1242.4]
  input  [31:0] io_csr_0_dataOut, // @[:@1243.4]
  input         io_csr_0_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_0_dataIn, // @[:@1243.4]
  output [31:0] io_csr_1_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_2_dataOut, // @[:@1243.4]
  input         io_csr_2_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_2_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_3_dataOut, // @[:@1243.4]
  input         io_csr_3_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_3_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_4_dataOut, // @[:@1243.4]
  input         io_csr_4_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_4_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_5_dataOut, // @[:@1243.4]
  input         io_csr_5_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_5_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_6_dataOut, // @[:@1243.4]
  input         io_csr_6_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_6_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_7_dataOut, // @[:@1243.4]
  input         io_csr_7_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_7_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_8_dataOut, // @[:@1243.4]
  input         io_csr_8_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_8_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_9_dataOut, // @[:@1243.4]
  input         io_csr_9_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_9_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_10_dataOut, // @[:@1243.4]
  input         io_csr_10_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_10_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_11_dataOut, // @[:@1243.4]
  input         io_csr_11_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_11_dataIn, // @[:@1243.4]
  output [31:0] io_csr_12_dataIn, // @[:@1243.4]
  output [31:0] io_csr_13_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_14_dataOut, // @[:@1243.4]
  input         io_csr_14_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_14_dataIn, // @[:@1243.4]
  input  [31:0] io_csr_15_dataOut, // @[:@1243.4]
  input         io_csr_15_dataWrite, // @[:@1243.4]
  output [31:0] io_csr_15_dataIn, // @[:@1243.4]
  output        io_irq_readerDone, // @[:@1243.4]
  output        io_irq_writerDone, // @[:@1243.4]
  input         io_sync_readerSync, // @[:@1243.4]
  input         io_sync_writerSync, // @[:@1243.4]
  input         io_xferRead_done, // @[:@1243.4]
  output [31:0] io_xferRead_address, // @[:@1243.4]
  output [31:0] io_xferRead_length, // @[:@1243.4]
  output        io_xferRead_valid, // @[:@1243.4]
  input         io_xferWrite_done, // @[:@1243.4]
  output [31:0] io_xferWrite_address, // @[:@1243.4]
  output        io_xferWrite_valid // @[:@1243.4]
);
  wire  addressGeneratorRead_clock; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  addressGeneratorRead_reset; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  addressGeneratorRead_io_ctl_start; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  addressGeneratorRead_io_ctl_busy; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  addressGeneratorRead_io_xfer_done; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire [31:0] addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 33:36:@1245.4]
  wire  transferSplitterRead_clock; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  transferSplitterRead_reset; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire [31:0] transferSplitterRead_io_xferIn_address; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire [31:0] transferSplitterRead_io_xferIn_length; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  transferSplitterRead_io_xferIn_valid; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  transferSplitterRead_io_xferOut_done; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire [31:0] transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire [31:0] transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 34:36:@1248.4]
  wire  addressGeneratorWrite_clock; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  addressGeneratorWrite_reset; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  addressGeneratorWrite_io_ctl_start; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  addressGeneratorWrite_io_ctl_busy; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  addressGeneratorWrite_io_xfer_done; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire [31:0] addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 36:37:@1251.4]
  wire  transferSplitterWrite_clock; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  transferSplitterWrite_reset; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire [31:0] transferSplitterWrite_io_xferIn_address; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire [31:0] transferSplitterWrite_io_xferIn_length; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  transferSplitterWrite_io_xferIn_valid; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  transferSplitterWrite_io_xferOut_done; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire [31:0] transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 37:37:@1254.4]
  wire  ClearCSRAXI_AXIL_AXIL_clock; // @[ClearCSR.scala 42:21:@1274.4]
  wire  ClearCSRAXI_AXIL_AXIL_reset; // @[ClearCSR.scala 42:21:@1274.4]
  wire [31:0] ClearCSRAXI_AXIL_AXIL_io_csr_dataOut; // @[ClearCSR.scala 42:21:@1274.4]
  wire  ClearCSRAXI_AXIL_AXIL_io_csr_dataWrite; // @[ClearCSR.scala 42:21:@1274.4]
  wire [31:0] ClearCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[ClearCSR.scala 42:21:@1274.4]
  wire [31:0] ClearCSRAXI_AXIL_AXIL_io_value; // @[ClearCSR.scala 42:21:@1274.4]
  wire [31:0] ClearCSRAXI_AXIL_AXIL_io_clear; // @[ClearCSR.scala 42:21:@1274.4]
  wire  StatusCSRAXI_AXIL_AXIL_clock; // @[StatusCSR.scala 34:21:@1283.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1283.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_io_value; // @[StatusCSR.scala 34:21:@1283.4]
  wire  InterruptControllerAXI_AXIL_AXIL_clock; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_reset; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_irq_readerDone; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_irq_writerDone; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_readBusy; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_writeBusy; // @[InterruptController.scala 55:22:@1291.4]
  wire [31:0] InterruptControllerAXI_AXIL_AXIL_io_imr_dataOut; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_imr_dataWrite; // @[InterruptController.scala 55:22:@1291.4]
  wire [31:0] InterruptControllerAXI_AXIL_AXIL_io_imr_dataIn; // @[InterruptController.scala 55:22:@1291.4]
  wire [31:0] InterruptControllerAXI_AXIL_AXIL_io_isr_dataOut; // @[InterruptController.scala 55:22:@1291.4]
  wire  InterruptControllerAXI_AXIL_AXIL_io_isr_dataWrite; // @[InterruptController.scala 55:22:@1291.4]
  wire [31:0] InterruptControllerAXI_AXIL_AXIL_io_isr_dataIn; // @[InterruptController.scala 55:22:@1291.4]
  wire  SimpleCSRAXI_AXIL_AXIL_clock; // @[SimpleCSR.scala 40:21:@1328.4]
  wire  SimpleCSRAXI_AXIL_AXIL_reset; // @[SimpleCSR.scala 40:21:@1328.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1328.4]
  wire  SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1328.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1328.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_io_value; // @[SimpleCSR.scala 40:21:@1328.4]
  wire  SimpleCSRAXI_AXIL_AXIL_1_clock; // @[SimpleCSR.scala 40:21:@1336.4]
  wire  SimpleCSRAXI_AXIL_AXIL_1_reset; // @[SimpleCSR.scala 40:21:@1336.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1336.4]
  wire  SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1336.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1336.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_1_io_value; // @[SimpleCSR.scala 40:21:@1336.4]
  wire  SimpleCSRAXI_AXIL_AXIL_2_clock; // @[SimpleCSR.scala 40:21:@1344.4]
  wire  SimpleCSRAXI_AXIL_AXIL_2_reset; // @[SimpleCSR.scala 40:21:@1344.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1344.4]
  wire  SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1344.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1344.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_2_io_value; // @[SimpleCSR.scala 40:21:@1344.4]
  wire  SimpleCSRAXI_AXIL_AXIL_3_clock; // @[SimpleCSR.scala 40:21:@1352.4]
  wire  SimpleCSRAXI_AXIL_AXIL_3_reset; // @[SimpleCSR.scala 40:21:@1352.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1352.4]
  wire  SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1352.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1352.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_3_io_value; // @[SimpleCSR.scala 40:21:@1352.4]
  wire  SimpleCSRAXI_AXIL_AXIL_4_clock; // @[SimpleCSR.scala 40:21:@1361.4]
  wire  SimpleCSRAXI_AXIL_AXIL_4_reset; // @[SimpleCSR.scala 40:21:@1361.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1361.4]
  wire  SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1361.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1361.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_4_io_value; // @[SimpleCSR.scala 40:21:@1361.4]
  wire  SimpleCSRAXI_AXIL_AXIL_5_clock; // @[SimpleCSR.scala 40:21:@1369.4]
  wire  SimpleCSRAXI_AXIL_AXIL_5_reset; // @[SimpleCSR.scala 40:21:@1369.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1369.4]
  wire  SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1369.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1369.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_5_io_value; // @[SimpleCSR.scala 40:21:@1369.4]
  wire  SimpleCSRAXI_AXIL_AXIL_6_clock; // @[SimpleCSR.scala 40:21:@1377.4]
  wire  SimpleCSRAXI_AXIL_AXIL_6_reset; // @[SimpleCSR.scala 40:21:@1377.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1377.4]
  wire  SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1377.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1377.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_6_io_value; // @[SimpleCSR.scala 40:21:@1377.4]
  wire  SimpleCSRAXI_AXIL_AXIL_7_clock; // @[SimpleCSR.scala 40:21:@1385.4]
  wire  SimpleCSRAXI_AXIL_AXIL_7_reset; // @[SimpleCSR.scala 40:21:@1385.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1385.4]
  wire  SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1385.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1385.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_7_io_value; // @[SimpleCSR.scala 40:21:@1385.4]
  wire  StatusCSRAXI_AXIL_AXIL_1_clock; // @[StatusCSR.scala 34:21:@1393.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_1_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1393.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_1_io_value; // @[StatusCSR.scala 34:21:@1393.4]
  wire  StatusCSRAXI_AXIL_AXIL_2_clock; // @[StatusCSR.scala 34:21:@1401.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_2_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1401.4]
  wire [31:0] StatusCSRAXI_AXIL_AXIL_2_io_value; // @[StatusCSR.scala 34:21:@1401.4]
  wire  SimpleCSRAXI_AXIL_AXIL_8_clock; // @[SimpleCSR.scala 40:21:@1409.4]
  wire  SimpleCSRAXI_AXIL_AXIL_8_reset; // @[SimpleCSR.scala 40:21:@1409.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1409.4]
  wire  SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1409.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1409.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_8_io_value; // @[SimpleCSR.scala 40:21:@1409.4]
  wire  SimpleCSRAXI_AXIL_AXIL_9_clock; // @[SimpleCSR.scala 40:21:@1416.4]
  wire  SimpleCSRAXI_AXIL_AXIL_9_reset; // @[SimpleCSR.scala 40:21:@1416.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1416.4]
  wire  SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1416.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1416.4]
  wire [31:0] SimpleCSRAXI_AXIL_AXIL_9_io_value; // @[SimpleCSR.scala 40:21:@1416.4]
  reg [1:0] status; // @[WorkerCSRWrapper.scala 39:23:@1258.4]
  reg [31:0] _RAND_0;
  reg  readerSync; // @[WorkerCSRWrapper.scala 41:27:@1260.4]
  reg [31:0] _RAND_1;
  reg  readerSyncOld; // @[WorkerCSRWrapper.scala 42:30:@1262.4]
  reg [31:0] _RAND_2;
  reg  writerSync; // @[WorkerCSRWrapper.scala 44:27:@1264.4]
  reg [31:0] _RAND_3;
  reg  writerSyncOld; // @[WorkerCSRWrapper.scala 45:30:@1266.4]
  reg [31:0] _RAND_4;
  reg  readerStart; // @[WorkerCSRWrapper.scala 47:28:@1268.4]
  reg [31:0] _RAND_5;
  reg  writerStart; // @[WorkerCSRWrapper.scala 48:28:@1269.4]
  reg [31:0] _RAND_6;
  wire [1:0] _T_207; // @[Cat.scala 30:58:@1306.4]
  wire [31:0] control; // @[WorkerCSRWrapper.scala 50:21:@1270.4 WorkerCSRWrapper.scala 59:11:@1282.4]
  wire  _T_208; // @[WorkerCSRWrapper.scala 66:56:@1307.4]
  wire  _T_209; // @[WorkerCSRWrapper.scala 66:68:@1308.4]
  wire [1:0] _T_210; // @[Cat.scala 30:58:@1309.4]
  wire [1:0] _T_211; // @[WorkerCSRWrapper.scala 66:44:@1310.4]
  wire [1:0] clear; // @[WorkerCSRWrapper.scala 66:42:@1311.4]
  wire  _T_214; // @[WorkerCSRWrapper.scala 68:20:@1313.4]
  wire  _T_215; // @[WorkerCSRWrapper.scala 68:35:@1314.4]
  wire  _T_216; // @[WorkerCSRWrapper.scala 68:60:@1315.4]
  wire  _T_217; // @[WorkerCSRWrapper.scala 68:50:@1316.4]
  wire  _T_218; // @[WorkerCSRWrapper.scala 68:75:@1317.4]
  wire  _T_219; // @[WorkerCSRWrapper.scala 68:65:@1318.4]
  wire  _T_221; // @[WorkerCSRWrapper.scala 69:20:@1320.4]
  wire  _T_222; // @[WorkerCSRWrapper.scala 69:35:@1321.4]
  wire  _T_223; // @[WorkerCSRWrapper.scala 69:60:@1322.4]
  wire  _T_224; // @[WorkerCSRWrapper.scala 69:50:@1323.4]
  wire  _T_225; // @[WorkerCSRWrapper.scala 69:75:@1324.4]
  wire  _T_226; // @[WorkerCSRWrapper.scala 69:65:@1325.4]
  AddressGeneratorAXI_AXIL_AXIL addressGeneratorRead ( // @[WorkerCSRWrapper.scala 33:36:@1245.4]
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
  TransferSplitterAXI_AXIL_AXIL transferSplitterRead ( // @[WorkerCSRWrapper.scala 34:36:@1248.4]
    .clock(transferSplitterRead_clock),
    .reset(transferSplitterRead_reset),
    .io_xferIn_done(transferSplitterRead_io_xferIn_done),
    .io_xferIn_address(transferSplitterRead_io_xferIn_address),
    .io_xferIn_length(transferSplitterRead_io_xferIn_length),
    .io_xferIn_valid(transferSplitterRead_io_xferIn_valid),
    .io_xferOut_done(transferSplitterRead_io_xferOut_done),
    .io_xferOut_address(transferSplitterRead_io_xferOut_address),
    .io_xferOut_length(transferSplitterRead_io_xferOut_length),
    .io_xferOut_valid(transferSplitterRead_io_xferOut_valid)
  );
  AddressGeneratorAXI_AXIL_AXIL addressGeneratorWrite ( // @[WorkerCSRWrapper.scala 36:37:@1251.4]
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
  TransferSplitterAXI_AXIL_AXIL_1 transferSplitterWrite ( // @[WorkerCSRWrapper.scala 37:37:@1254.4]
    .clock(transferSplitterWrite_clock),
    .reset(transferSplitterWrite_reset),
    .io_xferIn_done(transferSplitterWrite_io_xferIn_done),
    .io_xferIn_address(transferSplitterWrite_io_xferIn_address),
    .io_xferIn_length(transferSplitterWrite_io_xferIn_length),
    .io_xferIn_valid(transferSplitterWrite_io_xferIn_valid),
    .io_xferOut_done(transferSplitterWrite_io_xferOut_done),
    .io_xferOut_address(transferSplitterWrite_io_xferOut_address),
    .io_xferOut_valid(transferSplitterWrite_io_xferOut_valid)
  );
  ClearCSRAXI_AXIL_AXIL ClearCSRAXI_AXIL_AXIL ( // @[ClearCSR.scala 42:21:@1274.4]
    .clock(ClearCSRAXI_AXIL_AXIL_clock),
    .reset(ClearCSRAXI_AXIL_AXIL_reset),
    .io_csr_dataOut(ClearCSRAXI_AXIL_AXIL_io_csr_dataOut),
    .io_csr_dataWrite(ClearCSRAXI_AXIL_AXIL_io_csr_dataWrite),
    .io_csr_dataIn(ClearCSRAXI_AXIL_AXIL_io_csr_dataIn),
    .io_value(ClearCSRAXI_AXIL_AXIL_io_value),
    .io_clear(ClearCSRAXI_AXIL_AXIL_io_clear)
  );
  StatusCSRAXI_AXIL_AXIL StatusCSRAXI_AXIL_AXIL ( // @[StatusCSR.scala 34:21:@1283.4]
    .clock(StatusCSRAXI_AXIL_AXIL_clock),
    .io_csr_dataIn(StatusCSRAXI_AXIL_AXIL_io_csr_dataIn),
    .io_value(StatusCSRAXI_AXIL_AXIL_io_value)
  );
  InterruptControllerAXI_AXIL_AXIL InterruptControllerAXI_AXIL_AXIL ( // @[InterruptController.scala 55:22:@1291.4]
    .clock(InterruptControllerAXI_AXIL_AXIL_clock),
    .reset(InterruptControllerAXI_AXIL_AXIL_reset),
    .io_irq_readerDone(InterruptControllerAXI_AXIL_AXIL_io_irq_readerDone),
    .io_irq_writerDone(InterruptControllerAXI_AXIL_AXIL_io_irq_writerDone),
    .io_readBusy(InterruptControllerAXI_AXIL_AXIL_io_readBusy),
    .io_writeBusy(InterruptControllerAXI_AXIL_AXIL_io_writeBusy),
    .io_imr_dataOut(InterruptControllerAXI_AXIL_AXIL_io_imr_dataOut),
    .io_imr_dataWrite(InterruptControllerAXI_AXIL_AXIL_io_imr_dataWrite),
    .io_imr_dataIn(InterruptControllerAXI_AXIL_AXIL_io_imr_dataIn),
    .io_isr_dataOut(InterruptControllerAXI_AXIL_AXIL_io_isr_dataOut),
    .io_isr_dataWrite(InterruptControllerAXI_AXIL_AXIL_io_isr_dataWrite),
    .io_isr_dataIn(InterruptControllerAXI_AXIL_AXIL_io_isr_dataIn)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL ( // @[SimpleCSR.scala 40:21:@1328.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_1 ( // @[SimpleCSR.scala 40:21:@1336.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_1_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_1_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_1_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_2 ( // @[SimpleCSR.scala 40:21:@1344.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_2_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_2_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_2_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_3 ( // @[SimpleCSR.scala 40:21:@1352.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_3_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_3_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_3_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_4 ( // @[SimpleCSR.scala 40:21:@1361.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_4_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_4_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_4_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_5 ( // @[SimpleCSR.scala 40:21:@1369.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_5_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_5_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_5_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_6 ( // @[SimpleCSR.scala 40:21:@1377.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_6_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_6_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_6_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_7 ( // @[SimpleCSR.scala 40:21:@1385.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_7_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_7_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_7_io_value)
  );
  StatusCSRAXI_AXIL_AXIL StatusCSRAXI_AXIL_AXIL_1 ( // @[StatusCSR.scala 34:21:@1393.4]
    .clock(StatusCSRAXI_AXIL_AXIL_1_clock),
    .io_csr_dataIn(StatusCSRAXI_AXIL_AXIL_1_io_csr_dataIn),
    .io_value(StatusCSRAXI_AXIL_AXIL_1_io_value)
  );
  StatusCSRAXI_AXIL_AXIL StatusCSRAXI_AXIL_AXIL_2 ( // @[StatusCSR.scala 34:21:@1401.4]
    .clock(StatusCSRAXI_AXIL_AXIL_2_clock),
    .io_csr_dataIn(StatusCSRAXI_AXIL_AXIL_2_io_csr_dataIn),
    .io_value(StatusCSRAXI_AXIL_AXIL_2_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_8 ( // @[SimpleCSR.scala 40:21:@1409.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_8_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_8_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_8_io_value)
  );
  SimpleCSRAXI_AXIL_AXIL SimpleCSRAXI_AXIL_AXIL_9 ( // @[SimpleCSR.scala 40:21:@1416.4]
    .clock(SimpleCSRAXI_AXIL_AXIL_9_clock),
    .reset(SimpleCSRAXI_AXIL_AXIL_9_reset),
    .io_csr_dataOut(SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataIn),
    .io_value(SimpleCSRAXI_AXIL_AXIL_9_io_value)
  );
  assign _T_207 = {readerStart,writerStart}; // @[Cat.scala 30:58:@1306.4]
  assign control = ClearCSRAXI_AXIL_AXIL_io_value; // @[WorkerCSRWrapper.scala 50:21:@1270.4 WorkerCSRWrapper.scala 59:11:@1282.4]
  assign _T_208 = control[5]; // @[WorkerCSRWrapper.scala 66:56:@1307.4]
  assign _T_209 = control[4]; // @[WorkerCSRWrapper.scala 66:68:@1308.4]
  assign _T_210 = {_T_208,_T_209}; // @[Cat.scala 30:58:@1309.4]
  assign _T_211 = ~ _T_210; // @[WorkerCSRWrapper.scala 66:44:@1310.4]
  assign clear = _T_207 & _T_211; // @[WorkerCSRWrapper.scala 66:42:@1311.4]
  assign _T_214 = readerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 68:20:@1313.4]
  assign _T_215 = _T_214 & readerSync; // @[WorkerCSRWrapper.scala 68:35:@1314.4]
  assign _T_216 = control[3]; // @[WorkerCSRWrapper.scala 68:60:@1315.4]
  assign _T_217 = _T_215 | _T_216; // @[WorkerCSRWrapper.scala 68:50:@1316.4]
  assign _T_218 = control[1]; // @[WorkerCSRWrapper.scala 68:75:@1317.4]
  assign _T_219 = _T_217 & _T_218; // @[WorkerCSRWrapper.scala 68:65:@1318.4]
  assign _T_221 = writerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 69:20:@1320.4]
  assign _T_222 = _T_221 & writerSync; // @[WorkerCSRWrapper.scala 69:35:@1321.4]
  assign _T_223 = control[2]; // @[WorkerCSRWrapper.scala 69:60:@1322.4]
  assign _T_224 = _T_222 | _T_223; // @[WorkerCSRWrapper.scala 69:50:@1323.4]
  assign _T_225 = control[0]; // @[WorkerCSRWrapper.scala 69:75:@1324.4]
  assign _T_226 = _T_224 & _T_225; // @[WorkerCSRWrapper.scala 69:65:@1325.4]
  assign io_csr_0_dataIn = ClearCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[ClearCSR.scala 46:16:@1278.4]
  assign io_csr_1_dataIn = StatusCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1286.4]
  assign io_csr_2_dataIn = InterruptControllerAXI_AXIL_AXIL_io_imr_dataIn; // @[InterruptController.scala 60:17:@1296.4]
  assign io_csr_3_dataIn = InterruptControllerAXI_AXIL_AXIL_io_isr_dataIn; // @[InterruptController.scala 61:17:@1300.4]
  assign io_csr_4_dataIn = SimpleCSRAXI_AXIL_AXIL_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1331.4]
  assign io_csr_5_dataIn = SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1339.4]
  assign io_csr_6_dataIn = SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1347.4]
  assign io_csr_7_dataIn = SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1355.4]
  assign io_csr_8_dataIn = SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1364.4]
  assign io_csr_9_dataIn = SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1372.4]
  assign io_csr_10_dataIn = SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1380.4]
  assign io_csr_11_dataIn = SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1388.4]
  assign io_csr_12_dataIn = StatusCSRAXI_AXIL_AXIL_1_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1396.4]
  assign io_csr_13_dataIn = StatusCSRAXI_AXIL_AXIL_2_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1404.4]
  assign io_csr_14_dataIn = SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1412.4]
  assign io_csr_15_dataIn = SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1419.4]
  assign io_irq_readerDone = InterruptControllerAXI_AXIL_AXIL_io_irq_readerDone; // @[WorkerCSRWrapper.scala 63:10:@1305.4]
  assign io_irq_writerDone = InterruptControllerAXI_AXIL_AXIL_io_irq_writerDone; // @[WorkerCSRWrapper.scala 63:10:@1304.4]
  assign io_xferRead_address = transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 91:15:@1431.4]
  assign io_xferRead_length = transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 91:15:@1430.4]
  assign io_xferRead_valid = transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 91:15:@1429.4]
  assign io_xferWrite_address = transferSplitterWrite_io_xferOut_address; // @[WorkerCSRWrapper.scala 94:16:@1441.4]
  assign io_xferWrite_valid = transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 94:16:@1439.4]
  assign addressGeneratorRead_clock = clock; // @[:@1246.4]
  assign addressGeneratorRead_reset = reset; // @[:@1247.4]
  assign addressGeneratorRead_io_ctl_start = readerStart; // @[WorkerCSRWrapper.scala 71:37:@1327.4]
  assign addressGeneratorRead_io_ctl_startAddress = SimpleCSRAXI_AXIL_AXIL_io_value; // @[WorkerCSRWrapper.scala 72:44:@1335.4]
  assign addressGeneratorRead_io_ctl_lineLength = SimpleCSRAXI_AXIL_AXIL_1_io_value; // @[WorkerCSRWrapper.scala 73:42:@1343.4]
  assign addressGeneratorRead_io_ctl_lineCount = SimpleCSRAXI_AXIL_AXIL_2_io_value; // @[WorkerCSRWrapper.scala 74:41:@1351.4]
  assign addressGeneratorRead_io_ctl_lineGap = SimpleCSRAXI_AXIL_AXIL_3_io_value; // @[WorkerCSRWrapper.scala 75:39:@1359.4]
  assign addressGeneratorRead_io_xfer_done = transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 90:34:@1427.4]
  assign transferSplitterRead_clock = clock; // @[:@1249.4]
  assign transferSplitterRead_reset = reset; // @[:@1250.4]
  assign transferSplitterRead_io_xferIn_address = addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 90:34:@1426.4]
  assign transferSplitterRead_io_xferIn_length = addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 90:34:@1425.4]
  assign transferSplitterRead_io_xferIn_valid = addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 90:34:@1424.4]
  assign transferSplitterRead_io_xferOut_done = io_xferRead_done; // @[WorkerCSRWrapper.scala 91:15:@1432.4]
  assign addressGeneratorWrite_clock = clock; // @[:@1252.4]
  assign addressGeneratorWrite_reset = reset; // @[:@1253.4]
  assign addressGeneratorWrite_io_ctl_start = writerStart; // @[WorkerCSRWrapper.scala 77:38:@1360.4]
  assign addressGeneratorWrite_io_ctl_startAddress = SimpleCSRAXI_AXIL_AXIL_4_io_value; // @[WorkerCSRWrapper.scala 78:45:@1368.4]
  assign addressGeneratorWrite_io_ctl_lineLength = SimpleCSRAXI_AXIL_AXIL_5_io_value; // @[WorkerCSRWrapper.scala 79:43:@1376.4]
  assign addressGeneratorWrite_io_ctl_lineCount = SimpleCSRAXI_AXIL_AXIL_6_io_value; // @[WorkerCSRWrapper.scala 80:42:@1384.4]
  assign addressGeneratorWrite_io_ctl_lineGap = SimpleCSRAXI_AXIL_AXIL_7_io_value; // @[WorkerCSRWrapper.scala 81:40:@1392.4]
  assign addressGeneratorWrite_io_xfer_done = transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 93:35:@1437.4]
  assign transferSplitterWrite_clock = clock; // @[:@1255.4]
  assign transferSplitterWrite_reset = reset; // @[:@1256.4]
  assign transferSplitterWrite_io_xferIn_address = addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 93:35:@1436.4]
  assign transferSplitterWrite_io_xferIn_length = addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 93:35:@1435.4]
  assign transferSplitterWrite_io_xferIn_valid = addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 93:35:@1434.4]
  assign transferSplitterWrite_io_xferOut_done = io_xferWrite_done; // @[WorkerCSRWrapper.scala 94:16:@1442.4]
  assign ClearCSRAXI_AXIL_AXIL_clock = clock; // @[:@1275.4]
  assign ClearCSRAXI_AXIL_AXIL_reset = reset; // @[:@1276.4]
  assign ClearCSRAXI_AXIL_AXIL_io_csr_dataOut = io_csr_0_dataOut; // @[ClearCSR.scala 46:16:@1280.4]
  assign ClearCSRAXI_AXIL_AXIL_io_csr_dataWrite = io_csr_0_dataWrite; // @[ClearCSR.scala 46:16:@1279.4]
  assign ClearCSRAXI_AXIL_AXIL_io_clear = {{30'd0}, clear}; // @[ClearCSR.scala 44:18:@1277.4]
  assign StatusCSRAXI_AXIL_AXIL_clock = clock; // @[:@1284.4]
  assign StatusCSRAXI_AXIL_AXIL_io_value = {{30'd0}, status}; // @[StatusCSR.scala 38:18:@1290.4]
  assign InterruptControllerAXI_AXIL_AXIL_clock = clock; // @[:@1292.4]
  assign InterruptControllerAXI_AXIL_AXIL_reset = reset; // @[:@1293.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_readBusy = addressGeneratorRead_io_ctl_busy; // @[InterruptController.scala 57:22:@1294.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_writeBusy = addressGeneratorWrite_io_ctl_busy; // @[InterruptController.scala 58:23:@1295.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_imr_dataOut = io_csr_2_dataOut; // @[InterruptController.scala 60:17:@1298.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_imr_dataWrite = io_csr_2_dataWrite; // @[InterruptController.scala 60:17:@1297.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_isr_dataOut = io_csr_3_dataOut; // @[InterruptController.scala 61:17:@1302.4]
  assign InterruptControllerAXI_AXIL_AXIL_io_isr_dataWrite = io_csr_3_dataWrite; // @[InterruptController.scala 61:17:@1301.4]
  assign SimpleCSRAXI_AXIL_AXIL_clock = clock; // @[:@1329.4]
  assign SimpleCSRAXI_AXIL_AXIL_reset = reset; // @[:@1330.4]
  assign SimpleCSRAXI_AXIL_AXIL_io_csr_dataOut = io_csr_4_dataOut; // @[SimpleCSR.scala 42:16:@1333.4]
  assign SimpleCSRAXI_AXIL_AXIL_io_csr_dataWrite = io_csr_4_dataWrite; // @[SimpleCSR.scala 42:16:@1332.4]
  assign SimpleCSRAXI_AXIL_AXIL_1_clock = clock; // @[:@1337.4]
  assign SimpleCSRAXI_AXIL_AXIL_1_reset = reset; // @[:@1338.4]
  assign SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataOut = io_csr_5_dataOut; // @[SimpleCSR.scala 42:16:@1341.4]
  assign SimpleCSRAXI_AXIL_AXIL_1_io_csr_dataWrite = io_csr_5_dataWrite; // @[SimpleCSR.scala 42:16:@1340.4]
  assign SimpleCSRAXI_AXIL_AXIL_2_clock = clock; // @[:@1345.4]
  assign SimpleCSRAXI_AXIL_AXIL_2_reset = reset; // @[:@1346.4]
  assign SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataOut = io_csr_6_dataOut; // @[SimpleCSR.scala 42:16:@1349.4]
  assign SimpleCSRAXI_AXIL_AXIL_2_io_csr_dataWrite = io_csr_6_dataWrite; // @[SimpleCSR.scala 42:16:@1348.4]
  assign SimpleCSRAXI_AXIL_AXIL_3_clock = clock; // @[:@1353.4]
  assign SimpleCSRAXI_AXIL_AXIL_3_reset = reset; // @[:@1354.4]
  assign SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataOut = io_csr_7_dataOut; // @[SimpleCSR.scala 42:16:@1357.4]
  assign SimpleCSRAXI_AXIL_AXIL_3_io_csr_dataWrite = io_csr_7_dataWrite; // @[SimpleCSR.scala 42:16:@1356.4]
  assign SimpleCSRAXI_AXIL_AXIL_4_clock = clock; // @[:@1362.4]
  assign SimpleCSRAXI_AXIL_AXIL_4_reset = reset; // @[:@1363.4]
  assign SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataOut = io_csr_8_dataOut; // @[SimpleCSR.scala 42:16:@1366.4]
  assign SimpleCSRAXI_AXIL_AXIL_4_io_csr_dataWrite = io_csr_8_dataWrite; // @[SimpleCSR.scala 42:16:@1365.4]
  assign SimpleCSRAXI_AXIL_AXIL_5_clock = clock; // @[:@1370.4]
  assign SimpleCSRAXI_AXIL_AXIL_5_reset = reset; // @[:@1371.4]
  assign SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataOut = io_csr_9_dataOut; // @[SimpleCSR.scala 42:16:@1374.4]
  assign SimpleCSRAXI_AXIL_AXIL_5_io_csr_dataWrite = io_csr_9_dataWrite; // @[SimpleCSR.scala 42:16:@1373.4]
  assign SimpleCSRAXI_AXIL_AXIL_6_clock = clock; // @[:@1378.4]
  assign SimpleCSRAXI_AXIL_AXIL_6_reset = reset; // @[:@1379.4]
  assign SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataOut = io_csr_10_dataOut; // @[SimpleCSR.scala 42:16:@1382.4]
  assign SimpleCSRAXI_AXIL_AXIL_6_io_csr_dataWrite = io_csr_10_dataWrite; // @[SimpleCSR.scala 42:16:@1381.4]
  assign SimpleCSRAXI_AXIL_AXIL_7_clock = clock; // @[:@1386.4]
  assign SimpleCSRAXI_AXIL_AXIL_7_reset = reset; // @[:@1387.4]
  assign SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataOut = io_csr_11_dataOut; // @[SimpleCSR.scala 42:16:@1390.4]
  assign SimpleCSRAXI_AXIL_AXIL_7_io_csr_dataWrite = io_csr_11_dataWrite; // @[SimpleCSR.scala 42:16:@1389.4]
  assign StatusCSRAXI_AXIL_AXIL_1_clock = clock; // @[:@1394.4]
  assign StatusCSRAXI_AXIL_AXIL_1_io_value = 32'h0; // @[StatusCSR.scala 38:18:@1400.4]
  assign StatusCSRAXI_AXIL_AXIL_2_clock = clock; // @[:@1402.4]
  assign StatusCSRAXI_AXIL_AXIL_2_io_value = 32'h11; // @[StatusCSR.scala 38:18:@1408.4]
  assign SimpleCSRAXI_AXIL_AXIL_8_clock = clock; // @[:@1410.4]
  assign SimpleCSRAXI_AXIL_AXIL_8_reset = reset; // @[:@1411.4]
  assign SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataOut = io_csr_14_dataOut; // @[SimpleCSR.scala 42:16:@1414.4]
  assign SimpleCSRAXI_AXIL_AXIL_8_io_csr_dataWrite = io_csr_14_dataWrite; // @[SimpleCSR.scala 42:16:@1413.4]
  assign SimpleCSRAXI_AXIL_AXIL_9_clock = clock; // @[:@1417.4]
  assign SimpleCSRAXI_AXIL_AXIL_9_reset = reset; // @[:@1418.4]
  assign SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataOut = io_csr_15_dataOut; // @[SimpleCSR.scala 42:16:@1421.4]
  assign SimpleCSRAXI_AXIL_AXIL_9_io_csr_dataWrite = io_csr_15_dataWrite; // @[SimpleCSR.scala 42:16:@1420.4]
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
module Queue( // @[:@1444.2]
  input         clock, // @[:@1445.4]
  input         reset, // @[:@1446.4]
  output        io_enq_ready, // @[:@1447.4]
  input         io_enq_valid, // @[:@1447.4]
  input  [31:0] io_enq_bits, // @[:@1447.4]
  input         io_deq_ready, // @[:@1447.4]
  output        io_deq_valid, // @[:@1447.4]
  output [31:0] io_deq_bits // @[:@1447.4]
);
  reg [31:0] ram [0:511]; // @[Decoupled.scala 215:24:@1449.4]
  reg [31:0] _RAND_0;
  wire [31:0] ram__T_63_data; // @[Decoupled.scala 215:24:@1449.4]
  wire [8:0] ram__T_63_addr; // @[Decoupled.scala 215:24:@1449.4]
  wire [31:0] ram__T_49_data; // @[Decoupled.scala 215:24:@1449.4]
  wire [8:0] ram__T_49_addr; // @[Decoupled.scala 215:24:@1449.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 215:24:@1449.4]
  wire  ram__T_49_en; // @[Decoupled.scala 215:24:@1449.4]
  reg [8:0] value; // @[Counter.scala 26:33:@1450.4]
  reg [31:0] _RAND_1;
  reg [8:0] value_1; // @[Counter.scala 26:33:@1451.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 218:35:@1452.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 220:41:@1453.4]
  wire  _T_43; // @[Decoupled.scala 221:36:@1454.4]
  wire  empty; // @[Decoupled.scala 221:33:@1455.4]
  wire  _T_44; // @[Decoupled.scala 222:32:@1456.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@1457.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@1460.4]
  wire [9:0] _T_52; // @[Counter.scala 35:22:@1467.6]
  wire [8:0] _T_53; // @[Counter.scala 35:22:@1468.6]
  wire [8:0] _GEN_5; // @[Decoupled.scala 226:17:@1463.4]
  wire [9:0] _T_56; // @[Counter.scala 35:22:@1473.6]
  wire [8:0] _T_57; // @[Counter.scala 35:22:@1474.6]
  wire [8:0] _GEN_6; // @[Decoupled.scala 230:17:@1471.4]
  wire  _T_58; // @[Decoupled.scala 233:16:@1477.4]
  wire  _GEN_7; // @[Decoupled.scala 233:28:@1478.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 215:24:@1449.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 220:41:@1453.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 221:36:@1454.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 221:33:@1455.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 222:32:@1456.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@1457.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@1460.4]
  assign _T_52 = value + 9'h1; // @[Counter.scala 35:22:@1467.6]
  assign _T_53 = value + 9'h1; // @[Counter.scala 35:22:@1468.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 226:17:@1463.4]
  assign _T_56 = value_1 + 9'h1; // @[Counter.scala 35:22:@1473.6]
  assign _T_57 = value_1 + 9'h1; // @[Counter.scala 35:22:@1474.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 230:17:@1471.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 233:16:@1477.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 233:28:@1478.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 238:16:@1484.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 237:16:@1482.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 239:15:@1486.4]
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
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 215:24:@1449.4]
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
module DMATopAXI_AXIL_AXIL( // @[:@1495.2]
  input         clock, // @[:@1496.4]
  input         reset, // @[:@1497.4]
  input  [31:0] io_control_aw_awaddr, // @[:@1498.4]
  input  [2:0]  io_control_aw_awprot, // @[:@1498.4]
  input         io_control_aw_awvalid, // @[:@1498.4]
  output        io_control_aw_awready, // @[:@1498.4]
  input  [31:0] io_control_w_wdata, // @[:@1498.4]
  input  [3:0]  io_control_w_wstrb, // @[:@1498.4]
  input         io_control_w_wvalid, // @[:@1498.4]
  output        io_control_w_wready, // @[:@1498.4]
  output [1:0]  io_control_b_bresp, // @[:@1498.4]
  output        io_control_b_bvalid, // @[:@1498.4]
  input         io_control_b_bready, // @[:@1498.4]
  input  [31:0] io_control_ar_araddr, // @[:@1498.4]
  input  [2:0]  io_control_ar_arprot, // @[:@1498.4]
  input         io_control_ar_arvalid, // @[:@1498.4]
  output        io_control_ar_arready, // @[:@1498.4]
  output [31:0] io_control_r_rdata, // @[:@1498.4]
  output [1:0]  io_control_r_rresp, // @[:@1498.4]
  output        io_control_r_rvalid, // @[:@1498.4]
  input         io_control_r_rready, // @[:@1498.4]
  output [3:0]  io_read_aw_awid, // @[:@1498.4]
  output [31:0] io_read_aw_awaddr, // @[:@1498.4]
  output [7:0]  io_read_aw_awlen, // @[:@1498.4]
  output [2:0]  io_read_aw_awsize, // @[:@1498.4]
  output [1:0]  io_read_aw_awburst, // @[:@1498.4]
  output        io_read_aw_awlock, // @[:@1498.4]
  output [3:0]  io_read_aw_awcache, // @[:@1498.4]
  output [2:0]  io_read_aw_awprot, // @[:@1498.4]
  output [3:0]  io_read_aw_awqos, // @[:@1498.4]
  output        io_read_aw_awvalid, // @[:@1498.4]
  input         io_read_aw_awready, // @[:@1498.4]
  output [31:0] io_read_w_wdata, // @[:@1498.4]
  output [3:0]  io_read_w_wstrb, // @[:@1498.4]
  output        io_read_w_wlast, // @[:@1498.4]
  output        io_read_w_wvalid, // @[:@1498.4]
  input         io_read_w_wready, // @[:@1498.4]
  input  [3:0]  io_read_b_bid, // @[:@1498.4]
  input  [1:0]  io_read_b_bresp, // @[:@1498.4]
  input         io_read_b_bvalid, // @[:@1498.4]
  output        io_read_b_bready, // @[:@1498.4]
  output [3:0]  io_read_ar_arid, // @[:@1498.4]
  output [31:0] io_read_ar_araddr, // @[:@1498.4]
  output [7:0]  io_read_ar_arlen, // @[:@1498.4]
  output [2:0]  io_read_ar_arsize, // @[:@1498.4]
  output [1:0]  io_read_ar_arburst, // @[:@1498.4]
  output        io_read_ar_arlock, // @[:@1498.4]
  output [3:0]  io_read_ar_arcache, // @[:@1498.4]
  output [2:0]  io_read_ar_arprot, // @[:@1498.4]
  output [3:0]  io_read_ar_arqos, // @[:@1498.4]
  output        io_read_ar_arvalid, // @[:@1498.4]
  input         io_read_ar_arready, // @[:@1498.4]
  input  [3:0]  io_read_r_rid, // @[:@1498.4]
  input  [31:0] io_read_r_rdata, // @[:@1498.4]
  input  [1:0]  io_read_r_rresp, // @[:@1498.4]
  input         io_read_r_rlast, // @[:@1498.4]
  input         io_read_r_rvalid, // @[:@1498.4]
  output        io_read_r_rready, // @[:@1498.4]
  output [31:0] io_write_aw_awaddr, // @[:@1498.4]
  output [2:0]  io_write_aw_awprot, // @[:@1498.4]
  output        io_write_aw_awvalid, // @[:@1498.4]
  input         io_write_aw_awready, // @[:@1498.4]
  output [31:0] io_write_w_wdata, // @[:@1498.4]
  output [3:0]  io_write_w_wstrb, // @[:@1498.4]
  output        io_write_w_wvalid, // @[:@1498.4]
  input         io_write_w_wready, // @[:@1498.4]
  input  [1:0]  io_write_b_bresp, // @[:@1498.4]
  input         io_write_b_bvalid, // @[:@1498.4]
  output        io_write_b_bready, // @[:@1498.4]
  output [31:0] io_write_ar_araddr, // @[:@1498.4]
  output [2:0]  io_write_ar_arprot, // @[:@1498.4]
  output        io_write_ar_arvalid, // @[:@1498.4]
  input         io_write_ar_arready, // @[:@1498.4]
  input  [31:0] io_write_r_rdata, // @[:@1498.4]
  input  [1:0]  io_write_r_rresp, // @[:@1498.4]
  input         io_write_r_rvalid, // @[:@1498.4]
  output        io_write_r_rready, // @[:@1498.4]
  output        io_irq_readerDone, // @[:@1498.4]
  output        io_irq_writerDone, // @[:@1498.4]
  input         io_sync_readerSync, // @[:@1498.4]
  input         io_sync_writerSync // @[:@1498.4]
);
  wire  csrFrontend_clock; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_reset; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_ctl_aw_awaddr; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_aw_awvalid; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_ctl_w_wdata; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_w_wvalid; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_w_wready; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_b_bready; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_ctl_ar_araddr; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_ar_arvalid; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_ctl_r_rready; // @[DMATop.scala 38:27:@1500.4]
  wire [3:0] csrFrontend_io_bus_addr; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_bus_dataOut; // @[DMATop.scala 38:27:@1500.4]
  wire [31:0] csrFrontend_io_bus_dataIn; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_bus_write; // @[DMATop.scala 38:27:@1500.4]
  wire  csrFrontend_io_bus_read; // @[DMATop.scala 38:27:@1500.4]
  wire  readerFrontend_clock; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_reset; // @[DMATop.scala 40:30:@1503.4]
  wire [31:0] readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 40:30:@1503.4]
  wire [7:0] readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_bus_ar_arready; // @[DMATop.scala 40:30:@1503.4]
  wire [31:0] readerFrontend_io_bus_r_rdata; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_bus_r_rlast; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_bus_r_rvalid; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_bus_r_rready; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_dataIO_ready; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_dataIO_valid; // @[DMATop.scala 40:30:@1503.4]
  wire [31:0] readerFrontend_io_dataIO_bits; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_xfer_done; // @[DMATop.scala 40:30:@1503.4]
  wire [31:0] readerFrontend_io_xfer_address; // @[DMATop.scala 40:30:@1503.4]
  wire [31:0] readerFrontend_io_xfer_length; // @[DMATop.scala 40:30:@1503.4]
  wire  readerFrontend_io_xfer_valid; // @[DMATop.scala 40:30:@1503.4]
  wire  writerFrontend_clock; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_reset; // @[DMATop.scala 42:30:@1506.4]
  wire [31:0] writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_aw_awready; // @[DMATop.scala 42:30:@1506.4]
  wire [31:0] writerFrontend_io_bus_w_wdata; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_w_wready; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_b_bvalid; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_bus_b_bready; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_dataIO_ready; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_dataIO_valid; // @[DMATop.scala 42:30:@1506.4]
  wire [31:0] writerFrontend_io_dataIO_bits; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_xfer_done; // @[DMATop.scala 42:30:@1506.4]
  wire [31:0] writerFrontend_io_xfer_address; // @[DMATop.scala 42:30:@1506.4]
  wire  writerFrontend_io_xfer_valid; // @[DMATop.scala 42:30:@1506.4]
  wire [31:0] csr_io_csr_0_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_0_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_0_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_1_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_2_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_2_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_2_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_3_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_3_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_3_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_4_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_4_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_4_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_5_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_5_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_5_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_6_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_6_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_6_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_7_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_7_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_7_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_8_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_8_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_8_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_9_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_9_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_9_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_10_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_10_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_10_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_11_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_11_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_11_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_12_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_13_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_14_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_14_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_14_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_15_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_csr_15_dataWrite; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_csr_15_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire [3:0] csr_io_bus_addr; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_bus_dataOut; // @[DMATop.scala 44:19:@1509.4]
  wire [31:0] csr_io_bus_dataIn; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_bus_write; // @[DMATop.scala 44:19:@1509.4]
  wire  csr_io_bus_read; // @[DMATop.scala 44:19:@1509.4]
  wire  ctl_clock; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_reset; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_0_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_0_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_0_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_1_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_2_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_2_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_2_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_3_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_3_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_3_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_4_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_4_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_4_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_5_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_5_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_5_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_6_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_6_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_6_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_7_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_7_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_7_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_8_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_8_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_8_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_9_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_9_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_9_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_10_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_10_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_10_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_11_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_11_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_11_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_12_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_13_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_14_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_14_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_14_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_15_dataOut; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_csr_15_dataWrite; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_csr_15_dataIn; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_irq_readerDone; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_irq_writerDone; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_sync_readerSync; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_sync_writerSync; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_xferRead_done; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_xferRead_address; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_xferRead_length; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_xferRead_valid; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_xferWrite_done; // @[DMATop.scala 46:19:@1512.4]
  wire [31:0] ctl_io_xferWrite_address; // @[DMATop.scala 46:19:@1512.4]
  wire  ctl_io_xferWrite_valid; // @[DMATop.scala 46:19:@1512.4]
  wire  queue_clock; // @[Decoupled.scala 294:21:@1515.4]
  wire  queue_reset; // @[Decoupled.scala 294:21:@1515.4]
  wire  queue_io_enq_ready; // @[Decoupled.scala 294:21:@1515.4]
  wire  queue_io_enq_valid; // @[Decoupled.scala 294:21:@1515.4]
  wire [31:0] queue_io_enq_bits; // @[Decoupled.scala 294:21:@1515.4]
  wire  queue_io_deq_ready; // @[Decoupled.scala 294:21:@1515.4]
  wire  queue_io_deq_valid; // @[Decoupled.scala 294:21:@1515.4]
  wire [31:0] queue_io_deq_bits; // @[Decoupled.scala 294:21:@1515.4]
  AXI4LiteCSRAXI_AXIL_AXIL csrFrontend ( // @[DMATop.scala 38:27:@1500.4]
    .clock(csrFrontend_clock),
    .reset(csrFrontend_reset),
    .io_ctl_aw_awaddr(csrFrontend_io_ctl_aw_awaddr),
    .io_ctl_aw_awvalid(csrFrontend_io_ctl_aw_awvalid),
    .io_ctl_aw_awready(csrFrontend_io_ctl_aw_awready),
    .io_ctl_w_wdata(csrFrontend_io_ctl_w_wdata),
    .io_ctl_w_wvalid(csrFrontend_io_ctl_w_wvalid),
    .io_ctl_w_wready(csrFrontend_io_ctl_w_wready),
    .io_ctl_b_bvalid(csrFrontend_io_ctl_b_bvalid),
    .io_ctl_b_bready(csrFrontend_io_ctl_b_bready),
    .io_ctl_ar_araddr(csrFrontend_io_ctl_ar_araddr),
    .io_ctl_ar_arvalid(csrFrontend_io_ctl_ar_arvalid),
    .io_ctl_ar_arready(csrFrontend_io_ctl_ar_arready),
    .io_ctl_r_rdata(csrFrontend_io_ctl_r_rdata),
    .io_ctl_r_rvalid(csrFrontend_io_ctl_r_rvalid),
    .io_ctl_r_rready(csrFrontend_io_ctl_r_rready),
    .io_bus_addr(csrFrontend_io_bus_addr),
    .io_bus_dataOut(csrFrontend_io_bus_dataOut),
    .io_bus_dataIn(csrFrontend_io_bus_dataIn),
    .io_bus_write(csrFrontend_io_bus_write),
    .io_bus_read(csrFrontend_io_bus_read)
  );
  AXI4ReaderAXI_AXIL_AXIL readerFrontend ( // @[DMATop.scala 40:30:@1503.4]
    .clock(readerFrontend_clock),
    .reset(readerFrontend_reset),
    .io_bus_ar_araddr(readerFrontend_io_bus_ar_araddr),
    .io_bus_ar_arlen(readerFrontend_io_bus_ar_arlen),
    .io_bus_ar_arvalid(readerFrontend_io_bus_ar_arvalid),
    .io_bus_ar_arready(readerFrontend_io_bus_ar_arready),
    .io_bus_r_rdata(readerFrontend_io_bus_r_rdata),
    .io_bus_r_rlast(readerFrontend_io_bus_r_rlast),
    .io_bus_r_rvalid(readerFrontend_io_bus_r_rvalid),
    .io_bus_r_rready(readerFrontend_io_bus_r_rready),
    .io_dataIO_ready(readerFrontend_io_dataIO_ready),
    .io_dataIO_valid(readerFrontend_io_dataIO_valid),
    .io_dataIO_bits(readerFrontend_io_dataIO_bits),
    .io_xfer_done(readerFrontend_io_xfer_done),
    .io_xfer_address(readerFrontend_io_xfer_address),
    .io_xfer_length(readerFrontend_io_xfer_length),
    .io_xfer_valid(readerFrontend_io_xfer_valid)
  );
  AXI4LiteWriterAXI_AXIL_AXIL writerFrontend ( // @[DMATop.scala 42:30:@1506.4]
    .clock(writerFrontend_clock),
    .reset(writerFrontend_reset),
    .io_bus_aw_awaddr(writerFrontend_io_bus_aw_awaddr),
    .io_bus_aw_awvalid(writerFrontend_io_bus_aw_awvalid),
    .io_bus_aw_awready(writerFrontend_io_bus_aw_awready),
    .io_bus_w_wdata(writerFrontend_io_bus_w_wdata),
    .io_bus_w_wvalid(writerFrontend_io_bus_w_wvalid),
    .io_bus_w_wready(writerFrontend_io_bus_w_wready),
    .io_bus_b_bvalid(writerFrontend_io_bus_b_bvalid),
    .io_bus_b_bready(writerFrontend_io_bus_b_bready),
    .io_dataIO_ready(writerFrontend_io_dataIO_ready),
    .io_dataIO_valid(writerFrontend_io_dataIO_valid),
    .io_dataIO_bits(writerFrontend_io_dataIO_bits),
    .io_xfer_done(writerFrontend_io_xfer_done),
    .io_xfer_address(writerFrontend_io_xfer_address),
    .io_xfer_valid(writerFrontend_io_xfer_valid)
  );
  CSRAXI_AXIL_AXIL csr ( // @[DMATop.scala 44:19:@1509.4]
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
  WorkerCSRWrapperAXI_AXIL_AXIL ctl ( // @[DMATop.scala 46:19:@1512.4]
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
    .io_xferRead_address(ctl_io_xferRead_address),
    .io_xferRead_length(ctl_io_xferRead_length),
    .io_xferRead_valid(ctl_io_xferRead_valid),
    .io_xferWrite_done(ctl_io_xferWrite_done),
    .io_xferWrite_address(ctl_io_xferWrite_address),
    .io_xferWrite_valid(ctl_io_xferWrite_valid)
  );
  Queue queue ( // @[Decoupled.scala 294:21:@1515.4]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  assign io_control_aw_awready = csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 52:22:@1539.4]
  assign io_control_w_wready = csrFrontend_io_ctl_w_wready; // @[DMATop.scala 52:22:@1535.4]
  assign io_control_b_bresp = 2'h0; // @[DMATop.scala 52:22:@1534.4]
  assign io_control_b_bvalid = csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 52:22:@1533.4]
  assign io_control_ar_arready = csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 52:22:@1528.4]
  assign io_control_r_rdata = csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 52:22:@1527.4]
  assign io_control_r_rresp = 2'h0; // @[DMATop.scala 52:22:@1526.4]
  assign io_control_r_rvalid = csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 52:22:@1525.4]
  assign io_read_aw_awid = 4'h0; // @[DMATop.scala 58:11:@1658.4]
  assign io_read_aw_awaddr = 32'h0; // @[DMATop.scala 58:11:@1657.4]
  assign io_read_aw_awlen = 8'h0; // @[DMATop.scala 58:11:@1656.4]
  assign io_read_aw_awsize = 3'h0; // @[DMATop.scala 58:11:@1655.4]
  assign io_read_aw_awburst = 2'h0; // @[DMATop.scala 58:11:@1654.4]
  assign io_read_aw_awlock = 1'h0; // @[DMATop.scala 58:11:@1653.4]
  assign io_read_aw_awcache = 4'h0; // @[DMATop.scala 58:11:@1652.4]
  assign io_read_aw_awprot = 3'h0; // @[DMATop.scala 58:11:@1651.4]
  assign io_read_aw_awqos = 4'h0; // @[DMATop.scala 58:11:@1650.4]
  assign io_read_aw_awvalid = 1'h0; // @[DMATop.scala 58:11:@1649.4]
  assign io_read_w_wdata = 32'h0; // @[DMATop.scala 58:11:@1647.4]
  assign io_read_w_wstrb = 4'h0; // @[DMATop.scala 58:11:@1646.4]
  assign io_read_w_wlast = 1'h0; // @[DMATop.scala 58:11:@1645.4]
  assign io_read_w_wvalid = 1'h0; // @[DMATop.scala 58:11:@1644.4]
  assign io_read_b_bready = 1'h0; // @[DMATop.scala 58:11:@1639.4]
  assign io_read_ar_arid = 4'h0; // @[DMATop.scala 58:11:@1638.4]
  assign io_read_ar_araddr = readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 58:11:@1637.4]
  assign io_read_ar_arlen = readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 58:11:@1636.4]
  assign io_read_ar_arsize = 3'h2; // @[DMATop.scala 58:11:@1635.4]
  assign io_read_ar_arburst = 2'h1; // @[DMATop.scala 58:11:@1634.4]
  assign io_read_ar_arlock = 1'h0; // @[DMATop.scala 58:11:@1633.4]
  assign io_read_ar_arcache = 4'h2; // @[DMATop.scala 58:11:@1632.4]
  assign io_read_ar_arprot = 3'h0; // @[DMATop.scala 58:11:@1631.4]
  assign io_read_ar_arqos = 4'h0; // @[DMATop.scala 58:11:@1630.4]
  assign io_read_ar_arvalid = readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 58:11:@1629.4]
  assign io_read_r_rready = readerFrontend_io_bus_r_rready; // @[DMATop.scala 58:11:@1622.4]
  assign io_write_aw_awaddr = writerFrontend_io_bus_aw_awaddr; // @[DMATop.scala 59:12:@1677.4]
  assign io_write_aw_awprot = 3'h0; // @[DMATop.scala 59:12:@1676.4]
  assign io_write_aw_awvalid = writerFrontend_io_bus_aw_awvalid; // @[DMATop.scala 59:12:@1675.4]
  assign io_write_w_wdata = writerFrontend_io_bus_w_wdata; // @[DMATop.scala 59:12:@1673.4]
  assign io_write_w_wstrb = 4'hf; // @[DMATop.scala 59:12:@1672.4]
  assign io_write_w_wvalid = writerFrontend_io_bus_w_wvalid; // @[DMATop.scala 59:12:@1671.4]
  assign io_write_b_bready = writerFrontend_io_bus_b_bready; // @[DMATop.scala 59:12:@1667.4]
  assign io_write_ar_araddr = 32'h0; // @[DMATop.scala 59:12:@1666.4]
  assign io_write_ar_arprot = 3'h0; // @[DMATop.scala 59:12:@1665.4]
  assign io_write_ar_arvalid = 1'h0; // @[DMATop.scala 59:12:@1664.4]
  assign io_write_r_rready = 1'h0; // @[DMATop.scala 59:12:@1659.4]
  assign io_irq_readerDone = ctl_io_irq_readerDone; // @[DMATop.scala 61:10:@1679.4]
  assign io_irq_writerDone = ctl_io_irq_writerDone; // @[DMATop.scala 61:10:@1678.4]
  assign csrFrontend_clock = clock; // @[:@1501.4]
  assign csrFrontend_reset = reset; // @[:@1502.4]
  assign csrFrontend_io_ctl_aw_awaddr = io_control_aw_awaddr; // @[DMATop.scala 52:22:@1542.4]
  assign csrFrontend_io_ctl_aw_awvalid = io_control_aw_awvalid; // @[DMATop.scala 52:22:@1540.4]
  assign csrFrontend_io_ctl_w_wdata = io_control_w_wdata; // @[DMATop.scala 52:22:@1538.4]
  assign csrFrontend_io_ctl_w_wvalid = io_control_w_wvalid; // @[DMATop.scala 52:22:@1536.4]
  assign csrFrontend_io_ctl_b_bready = io_control_b_bready; // @[DMATop.scala 52:22:@1532.4]
  assign csrFrontend_io_ctl_ar_araddr = io_control_ar_araddr; // @[DMATop.scala 52:22:@1531.4]
  assign csrFrontend_io_ctl_ar_arvalid = io_control_ar_arvalid; // @[DMATop.scala 52:22:@1529.4]
  assign csrFrontend_io_ctl_r_rready = io_control_r_rready; // @[DMATop.scala 52:22:@1524.4]
  assign csrFrontend_io_bus_dataIn = csr_io_bus_dataIn; // @[DMATop.scala 53:14:@1545.4]
  assign readerFrontend_clock = clock; // @[:@1504.4]
  assign readerFrontend_reset = reset; // @[:@1505.4]
  assign readerFrontend_io_bus_ar_arready = io_read_ar_arready; // @[DMATop.scala 58:11:@1628.4]
  assign readerFrontend_io_bus_r_rdata = io_read_r_rdata; // @[DMATop.scala 58:11:@1626.4]
  assign readerFrontend_io_bus_r_rlast = io_read_r_rlast; // @[DMATop.scala 58:11:@1624.4]
  assign readerFrontend_io_bus_r_rvalid = io_read_r_rvalid; // @[DMATop.scala 58:11:@1623.4]
  assign readerFrontend_io_dataIO_ready = queue_io_enq_ready; // @[Decoupled.scala 297:17:@1520.4]
  assign readerFrontend_io_xfer_address = ctl_io_xferRead_address; // @[DMATop.scala 55:26:@1615.4]
  assign readerFrontend_io_xfer_length = ctl_io_xferRead_length; // @[DMATop.scala 55:26:@1614.4]
  assign readerFrontend_io_xfer_valid = ctl_io_xferRead_valid; // @[DMATop.scala 55:26:@1613.4]
  assign writerFrontend_clock = clock; // @[:@1507.4]
  assign writerFrontend_reset = reset; // @[:@1508.4]
  assign writerFrontend_io_bus_aw_awready = io_write_aw_awready; // @[DMATop.scala 59:12:@1674.4]
  assign writerFrontend_io_bus_w_wready = io_write_w_wready; // @[DMATop.scala 59:12:@1670.4]
  assign writerFrontend_io_bus_b_bvalid = io_write_b_bvalid; // @[DMATop.scala 59:12:@1668.4]
  assign writerFrontend_io_dataIO_valid = queue_io_deq_valid; // @[DMATop.scala 50:9:@1522.4]
  assign writerFrontend_io_dataIO_bits = queue_io_deq_bits; // @[DMATop.scala 50:9:@1521.4]
  assign writerFrontend_io_xfer_address = ctl_io_xferWrite_address; // @[DMATop.scala 56:26:@1620.4]
  assign writerFrontend_io_xfer_valid = ctl_io_xferWrite_valid; // @[DMATop.scala 56:26:@1618.4]
  assign csr_io_csr_0_dataIn = ctl_io_csr_0_dataIn; // @[DMATop.scala 54:14:@1548.4]
  assign csr_io_csr_1_dataIn = ctl_io_csr_1_dataIn; // @[DMATop.scala 54:14:@1552.4]
  assign csr_io_csr_2_dataIn = ctl_io_csr_2_dataIn; // @[DMATop.scala 54:14:@1556.4]
  assign csr_io_csr_3_dataIn = ctl_io_csr_3_dataIn; // @[DMATop.scala 54:14:@1560.4]
  assign csr_io_csr_4_dataIn = ctl_io_csr_4_dataIn; // @[DMATop.scala 54:14:@1564.4]
  assign csr_io_csr_5_dataIn = ctl_io_csr_5_dataIn; // @[DMATop.scala 54:14:@1568.4]
  assign csr_io_csr_6_dataIn = ctl_io_csr_6_dataIn; // @[DMATop.scala 54:14:@1572.4]
  assign csr_io_csr_7_dataIn = ctl_io_csr_7_dataIn; // @[DMATop.scala 54:14:@1576.4]
  assign csr_io_csr_8_dataIn = ctl_io_csr_8_dataIn; // @[DMATop.scala 54:14:@1580.4]
  assign csr_io_csr_9_dataIn = ctl_io_csr_9_dataIn; // @[DMATop.scala 54:14:@1584.4]
  assign csr_io_csr_10_dataIn = ctl_io_csr_10_dataIn; // @[DMATop.scala 54:14:@1588.4]
  assign csr_io_csr_11_dataIn = ctl_io_csr_11_dataIn; // @[DMATop.scala 54:14:@1592.4]
  assign csr_io_csr_12_dataIn = ctl_io_csr_12_dataIn; // @[DMATop.scala 54:14:@1596.4]
  assign csr_io_csr_13_dataIn = ctl_io_csr_13_dataIn; // @[DMATop.scala 54:14:@1600.4]
  assign csr_io_csr_14_dataIn = ctl_io_csr_14_dataIn; // @[DMATop.scala 54:14:@1604.4]
  assign csr_io_csr_15_dataIn = ctl_io_csr_15_dataIn; // @[DMATop.scala 54:14:@1608.4]
  assign csr_io_bus_addr = csrFrontend_io_bus_addr; // @[DMATop.scala 53:14:@1547.4]
  assign csr_io_bus_dataOut = csrFrontend_io_bus_dataOut; // @[DMATop.scala 53:14:@1546.4]
  assign csr_io_bus_write = csrFrontend_io_bus_write; // @[DMATop.scala 53:14:@1544.4]
  assign csr_io_bus_read = csrFrontend_io_bus_read; // @[DMATop.scala 53:14:@1543.4]
  assign ctl_clock = clock; // @[:@1513.4]
  assign ctl_reset = reset; // @[:@1514.4]
  assign ctl_io_csr_0_dataOut = csr_io_csr_0_dataOut; // @[DMATop.scala 54:14:@1550.4]
  assign ctl_io_csr_0_dataWrite = csr_io_csr_0_dataWrite; // @[DMATop.scala 54:14:@1549.4]
  assign ctl_io_csr_2_dataOut = csr_io_csr_2_dataOut; // @[DMATop.scala 54:14:@1558.4]
  assign ctl_io_csr_2_dataWrite = csr_io_csr_2_dataWrite; // @[DMATop.scala 54:14:@1557.4]
  assign ctl_io_csr_3_dataOut = csr_io_csr_3_dataOut; // @[DMATop.scala 54:14:@1562.4]
  assign ctl_io_csr_3_dataWrite = csr_io_csr_3_dataWrite; // @[DMATop.scala 54:14:@1561.4]
  assign ctl_io_csr_4_dataOut = csr_io_csr_4_dataOut; // @[DMATop.scala 54:14:@1566.4]
  assign ctl_io_csr_4_dataWrite = csr_io_csr_4_dataWrite; // @[DMATop.scala 54:14:@1565.4]
  assign ctl_io_csr_5_dataOut = csr_io_csr_5_dataOut; // @[DMATop.scala 54:14:@1570.4]
  assign ctl_io_csr_5_dataWrite = csr_io_csr_5_dataWrite; // @[DMATop.scala 54:14:@1569.4]
  assign ctl_io_csr_6_dataOut = csr_io_csr_6_dataOut; // @[DMATop.scala 54:14:@1574.4]
  assign ctl_io_csr_6_dataWrite = csr_io_csr_6_dataWrite; // @[DMATop.scala 54:14:@1573.4]
  assign ctl_io_csr_7_dataOut = csr_io_csr_7_dataOut; // @[DMATop.scala 54:14:@1578.4]
  assign ctl_io_csr_7_dataWrite = csr_io_csr_7_dataWrite; // @[DMATop.scala 54:14:@1577.4]
  assign ctl_io_csr_8_dataOut = csr_io_csr_8_dataOut; // @[DMATop.scala 54:14:@1582.4]
  assign ctl_io_csr_8_dataWrite = csr_io_csr_8_dataWrite; // @[DMATop.scala 54:14:@1581.4]
  assign ctl_io_csr_9_dataOut = csr_io_csr_9_dataOut; // @[DMATop.scala 54:14:@1586.4]
  assign ctl_io_csr_9_dataWrite = csr_io_csr_9_dataWrite; // @[DMATop.scala 54:14:@1585.4]
  assign ctl_io_csr_10_dataOut = csr_io_csr_10_dataOut; // @[DMATop.scala 54:14:@1590.4]
  assign ctl_io_csr_10_dataWrite = csr_io_csr_10_dataWrite; // @[DMATop.scala 54:14:@1589.4]
  assign ctl_io_csr_11_dataOut = csr_io_csr_11_dataOut; // @[DMATop.scala 54:14:@1594.4]
  assign ctl_io_csr_11_dataWrite = csr_io_csr_11_dataWrite; // @[DMATop.scala 54:14:@1593.4]
  assign ctl_io_csr_14_dataOut = csr_io_csr_14_dataOut; // @[DMATop.scala 54:14:@1606.4]
  assign ctl_io_csr_14_dataWrite = csr_io_csr_14_dataWrite; // @[DMATop.scala 54:14:@1605.4]
  assign ctl_io_csr_15_dataOut = csr_io_csr_15_dataOut; // @[DMATop.scala 54:14:@1610.4]
  assign ctl_io_csr_15_dataWrite = csr_io_csr_15_dataWrite; // @[DMATop.scala 54:14:@1609.4]
  assign ctl_io_sync_readerSync = io_sync_readerSync; // @[DMATop.scala 62:11:@1681.4]
  assign ctl_io_sync_writerSync = io_sync_writerSync; // @[DMATop.scala 62:11:@1680.4]
  assign ctl_io_xferRead_done = readerFrontend_io_xfer_done; // @[DMATop.scala 55:26:@1616.4]
  assign ctl_io_xferWrite_done = writerFrontend_io_xfer_done; // @[DMATop.scala 56:26:@1621.4]
  assign queue_clock = clock; // @[:@1516.4]
  assign queue_reset = reset; // @[:@1517.4]
  assign queue_io_enq_valid = readerFrontend_io_dataIO_valid; // @[Decoupled.scala 295:22:@1518.4]
  assign queue_io_enq_bits = readerFrontend_io_dataIO_bits; // @[Decoupled.scala 296:21:@1519.4]
  assign queue_io_deq_ready = writerFrontend_io_dataIO_ready; // @[DMATop.scala 50:9:@1523.4]
endmodule
