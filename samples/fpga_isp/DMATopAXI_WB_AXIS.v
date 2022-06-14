module WishboneCSRAXI_WB_AXIS( // @[:@3.2]
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
module AXI4ReaderAXI_WB_AXIS( // @[:@40.2]
  input         clock, // @[:@41.4]
  input         reset, // @[:@42.4]
  output [31:0] io_bus_ar_araddr, // @[:@43.4]
  output [7:0]  io_bus_ar_arlen, // @[:@43.4]
  output        io_bus_ar_arvalid, // @[:@43.4]
  input         io_bus_ar_arready, // @[:@43.4]
  input  [31:0] io_bus_r_rdata, // @[:@43.4]
  input         io_bus_r_rlast, // @[:@43.4]
  input         io_bus_r_rvalid, // @[:@43.4]
  output        io_bus_r_rready, // @[:@43.4]
  input         io_dataIO_ready, // @[:@43.4]
  output        io_dataIO_valid, // @[:@43.4]
  output [31:0] io_dataIO_bits, // @[:@43.4]
  output        io_xfer_done, // @[:@43.4]
  input  [31:0] io_xfer_address, // @[:@43.4]
  input  [31:0] io_xfer_length, // @[:@43.4]
  input         io_xfer_valid // @[:@43.4]
);
  reg [1:0] state; // @[AXI4Reader.scala 34:22:@45.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXI4Reader.scala 36:21:@46.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXI4Reader.scala 37:23:@47.4]
  reg [31:0] _RAND_2;
  reg [31:0] araddr; // @[AXI4Reader.scala 39:23:@49.4]
  reg [31:0] _RAND_3;
  reg [7:0] arlen; // @[AXI4Reader.scala 40:22:@50.4]
  reg [31:0] _RAND_4;
  reg  arvalid; // @[AXI4Reader.scala 41:24:@51.4]
  reg [31:0] _RAND_5;
  wire  ready; // @[AXI4Reader.scala 44:40:@54.4]
  wire  valid; // @[AXI4Reader.scala 45:40:@57.4]
  wire  _T_231; // @[Conditional.scala 37:30:@131.4]
  wire [32:0] _T_235; // @[AXI4Reader.scala 64:33:@138.8]
  wire [32:0] _T_236; // @[AXI4Reader.scala 64:33:@139.8]
  wire [31:0] _T_237; // @[AXI4Reader.scala 64:33:@140.8]
  wire [1:0] _GEN_0; // @[AXI4Reader.scala 60:26:@134.6]
  wire  _GEN_1; // @[AXI4Reader.scala 60:26:@134.6]
  wire [31:0] _GEN_2; // @[AXI4Reader.scala 60:26:@134.6]
  wire [31:0] _GEN_3; // @[AXI4Reader.scala 60:26:@134.6]
  wire  _T_238; // @[Conditional.scala 37:30:@145.6]
  wire  _T_239; // @[AXI4Reader.scala 68:20:@147.8]
  wire [1:0] _GEN_4; // @[AXI4Reader.scala 68:41:@148.8]
  wire  _GEN_5; // @[AXI4Reader.scala 68:41:@148.8]
  wire  _GEN_6; // @[AXI4Reader.scala 68:41:@148.8]
  wire  _T_242; // @[Conditional.scala 37:30:@155.8]
  wire  _T_243; // @[AXI4Reader.scala 75:18:@157.10]
  wire [1:0] _GEN_7; // @[AXI4Reader.scala 76:29:@159.12]
  wire  _GEN_8; // @[AXI4Reader.scala 76:29:@159.12]
  wire [1:0] _GEN_9; // @[AXI4Reader.scala 75:27:@158.10]
  wire  _GEN_10; // @[AXI4Reader.scala 75:27:@158.10]
  wire  _T_245; // @[Conditional.scala 37:30:@166.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@167.10]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@167.10]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@156.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@156.8]
  wire  _GEN_15; // @[Conditional.scala 39:67:@156.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@146.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@146.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@146.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@146.6]
  wire  _GEN_20; // @[Conditional.scala 40:58:@132.4]
  wire [1:0] _GEN_21; // @[Conditional.scala 40:58:@132.4]
  wire  _GEN_22; // @[Conditional.scala 40:58:@132.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@132.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@132.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@132.4]
  assign ready = io_dataIO_ready & enable; // @[AXI4Reader.scala 44:40:@54.4]
  assign valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 45:40:@57.4]
  assign _T_231 = 2'h0 == state; // @[Conditional.scala 37:30:@131.4]
  assign _T_235 = io_xfer_length - 32'h1; // @[AXI4Reader.scala 64:33:@138.8]
  assign _T_236 = $unsigned(_T_235); // @[AXI4Reader.scala 64:33:@139.8]
  assign _T_237 = _T_236[31:0]; // @[AXI4Reader.scala 64:33:@140.8]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXI4Reader.scala 60:26:@134.6]
  assign _GEN_1 = io_xfer_valid ? 1'h1 : arvalid; // @[AXI4Reader.scala 60:26:@134.6]
  assign _GEN_2 = io_xfer_valid ? io_xfer_address : araddr; // @[AXI4Reader.scala 60:26:@134.6]
  assign _GEN_3 = io_xfer_valid ? _T_237 : {{24'd0}, arlen}; // @[AXI4Reader.scala 60:26:@134.6]
  assign _T_238 = 2'h1 == state; // @[Conditional.scala 37:30:@145.6]
  assign _T_239 = arvalid & io_bus_ar_arready; // @[AXI4Reader.scala 68:20:@147.8]
  assign _GEN_4 = _T_239 ? 2'h2 : state; // @[AXI4Reader.scala 68:41:@148.8]
  assign _GEN_5 = _T_239 ? 1'h0 : arvalid; // @[AXI4Reader.scala 68:41:@148.8]
  assign _GEN_6 = _T_239 ? 1'h1 : enable; // @[AXI4Reader.scala 68:41:@148.8]
  assign _T_242 = 2'h2 == state; // @[Conditional.scala 37:30:@155.8]
  assign _T_243 = ready & valid; // @[AXI4Reader.scala 75:18:@157.10]
  assign _GEN_7 = io_bus_r_rlast ? 2'h3 : state; // @[AXI4Reader.scala 76:29:@159.12]
  assign _GEN_8 = io_bus_r_rlast ? 1'h0 : enable; // @[AXI4Reader.scala 76:29:@159.12]
  assign _GEN_9 = _T_243 ? _GEN_7 : state; // @[AXI4Reader.scala 75:27:@158.10]
  assign _GEN_10 = _T_243 ? _GEN_8 : enable; // @[AXI4Reader.scala 75:27:@158.10]
  assign _T_245 = 2'h3 == state; // @[Conditional.scala 37:30:@166.10]
  assign _GEN_11 = _T_245 ? 1'h1 : done; // @[Conditional.scala 39:67:@167.10]
  assign _GEN_12 = _T_245 ? 2'h0 : state; // @[Conditional.scala 39:67:@167.10]
  assign _GEN_13 = _T_242 ? _GEN_9 : _GEN_12; // @[Conditional.scala 39:67:@156.8]
  assign _GEN_14 = _T_242 ? _GEN_10 : enable; // @[Conditional.scala 39:67:@156.8]
  assign _GEN_15 = _T_242 ? done : _GEN_11; // @[Conditional.scala 39:67:@156.8]
  assign _GEN_16 = _T_238 ? _GEN_4 : _GEN_13; // @[Conditional.scala 39:67:@146.6]
  assign _GEN_17 = _T_238 ? _GEN_5 : arvalid; // @[Conditional.scala 39:67:@146.6]
  assign _GEN_18 = _T_238 ? _GEN_6 : _GEN_14; // @[Conditional.scala 39:67:@146.6]
  assign _GEN_19 = _T_238 ? done : _GEN_15; // @[Conditional.scala 39:67:@146.6]
  assign _GEN_20 = _T_231 ? 1'h0 : _GEN_19; // @[Conditional.scala 40:58:@132.4]
  assign _GEN_21 = _T_231 ? _GEN_0 : _GEN_16; // @[Conditional.scala 40:58:@132.4]
  assign _GEN_22 = _T_231 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@132.4]
  assign _GEN_23 = _T_231 ? _GEN_2 : araddr; // @[Conditional.scala 40:58:@132.4]
  assign _GEN_24 = _T_231 ? _GEN_3 : {{24'd0}, arlen}; // @[Conditional.scala 40:58:@132.4]
  assign _GEN_25 = _T_231 ? enable : _GEN_18; // @[Conditional.scala 40:58:@132.4]
  assign io_bus_ar_araddr = araddr; // @[AXI4Reader.scala 50:13:@118.4]
  assign io_bus_ar_arlen = arlen; // @[AXI4Reader.scala 50:13:@117.4]
  assign io_bus_ar_arvalid = arvalid; // @[AXI4Reader.scala 50:13:@110.4]
  assign io_bus_r_rready = io_dataIO_ready & enable; // @[AXI4Reader.scala 51:12:@122.4]
  assign io_dataIO_valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 53:19:@128.4]
  assign io_dataIO_bits = io_bus_r_rdata; // @[AXI4Reader.scala 54:18:@129.4]
  assign io_xfer_done = done; // @[AXI4Reader.scala 55:16:@130.4]
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
module AXIStreamMasterAXI_WB_AXIS( // @[:@172.2]
  input         clock, // @[:@173.4]
  input         reset, // @[:@174.4]
  output [31:0] io_bus_tdata, // @[:@175.4]
  output        io_bus_tvalid, // @[:@175.4]
  input         io_bus_tready, // @[:@175.4]
  output        io_bus_tuser, // @[:@175.4]
  output        io_bus_tlast, // @[:@175.4]
  output        io_dataIO_ready, // @[:@175.4]
  input         io_dataIO_valid, // @[:@175.4]
  input  [31:0] io_dataIO_bits, // @[:@175.4]
  output        io_xfer_done, // @[:@175.4]
  input  [31:0] io_xfer_length, // @[:@175.4]
  input         io_xfer_valid, // @[:@175.4]
  input         io_xfer_first // @[:@175.4]
);
  reg [1:0] state; // @[AXIStreamMaster.scala 34:22:@177.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXIStreamMaster.scala 36:21:@178.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXIStreamMaster.scala 38:23:@179.4]
  reg [31:0] _RAND_2;
  reg  user; // @[AXIStreamMaster.scala 40:21:@182.4]
  reg [31:0] _RAND_3;
  reg [31:0] length; // @[AXIStreamMaster.scala 42:23:@183.4]
  reg [31:0] _RAND_4;
  wire  ready; // @[AXIStreamMaster.scala 44:38:@184.4]
  wire  valid; // @[AXIStreamMaster.scala 45:40:@187.4]
  wire  last; // @[AXIStreamMaster.scala 56:18:@196.4]
  wire  _T_66; // @[Conditional.scala 37:30:@198.4]
  wire  _GEN_0; // @[AXIStreamMaster.scala 63:26:@202.6]
  wire [1:0] _GEN_1; // @[AXIStreamMaster.scala 63:26:@202.6]
  wire [31:0] _GEN_2; // @[AXIStreamMaster.scala 63:26:@202.6]
  wire  _T_70; // @[Conditional.scala 37:30:@210.6]
  wire  _T_71; // @[AXIStreamMaster.scala 71:18:@212.8]
  wire [32:0] _T_74; // @[AXIStreamMaster.scala 73:26:@215.10]
  wire [32:0] _T_75; // @[AXIStreamMaster.scala 73:26:@216.10]
  wire [31:0] _T_76; // @[AXIStreamMaster.scala 73:26:@217.10]
  wire [1:0] _GEN_4; // @[AXIStreamMaster.scala 74:29:@220.10]
  wire  _GEN_5; // @[AXIStreamMaster.scala 74:29:@220.10]
  wire  _GEN_6; // @[AXIStreamMaster.scala 71:27:@213.8]
  wire [31:0] _GEN_7; // @[AXIStreamMaster.scala 71:27:@213.8]
  wire [1:0] _GEN_8; // @[AXIStreamMaster.scala 71:27:@213.8]
  wire  _GEN_9; // @[AXIStreamMaster.scala 71:27:@213.8]
  wire  _T_80; // @[Conditional.scala 37:30:@227.8]
  wire [1:0] _GEN_10; // @[Conditional.scala 39:67:@228.8]
  wire  _GEN_11; // @[Conditional.scala 39:67:@228.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@211.6]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@211.6]
  wire [1:0] _GEN_14; // @[Conditional.scala 39:67:@211.6]
  wire  _GEN_15; // @[Conditional.scala 39:67:@211.6]
  wire  _GEN_16; // @[Conditional.scala 39:67:@211.6]
  wire  _GEN_17; // @[Conditional.scala 40:58:@199.4]
  wire  _GEN_18; // @[Conditional.scala 40:58:@199.4]
  wire  _GEN_19; // @[Conditional.scala 40:58:@199.4]
  wire [1:0] _GEN_20; // @[Conditional.scala 40:58:@199.4]
  wire [31:0] _GEN_21; // @[Conditional.scala 40:58:@199.4]
  assign ready = io_bus_tready & enable; // @[AXIStreamMaster.scala 44:38:@184.4]
  assign valid = io_dataIO_valid & enable; // @[AXIStreamMaster.scala 45:40:@187.4]
  assign last = length == 32'h1; // @[AXIStreamMaster.scala 56:18:@196.4]
  assign _T_66 = 2'h0 == state; // @[Conditional.scala 37:30:@198.4]
  assign _GEN_0 = io_xfer_valid ? io_xfer_first : user; // @[AXIStreamMaster.scala 63:26:@202.6]
  assign _GEN_1 = io_xfer_valid ? 2'h1 : state; // @[AXIStreamMaster.scala 63:26:@202.6]
  assign _GEN_2 = io_xfer_valid ? io_xfer_length : length; // @[AXIStreamMaster.scala 63:26:@202.6]
  assign _T_70 = 2'h1 == state; // @[Conditional.scala 37:30:@210.6]
  assign _T_71 = ready & valid; // @[AXIStreamMaster.scala 71:18:@212.8]
  assign _T_74 = length - 32'h1; // @[AXIStreamMaster.scala 73:26:@215.10]
  assign _T_75 = $unsigned(_T_74); // @[AXIStreamMaster.scala 73:26:@216.10]
  assign _T_76 = _T_75[31:0]; // @[AXIStreamMaster.scala 73:26:@217.10]
  assign _GEN_4 = last ? 2'h2 : state; // @[AXIStreamMaster.scala 74:29:@220.10]
  assign _GEN_5 = last ? 1'h0 : enable; // @[AXIStreamMaster.scala 74:29:@220.10]
  assign _GEN_6 = _T_71 ? 1'h0 : user; // @[AXIStreamMaster.scala 71:27:@213.8]
  assign _GEN_7 = _T_71 ? _T_76 : length; // @[AXIStreamMaster.scala 71:27:@213.8]
  assign _GEN_8 = _T_71 ? _GEN_4 : state; // @[AXIStreamMaster.scala 71:27:@213.8]
  assign _GEN_9 = _T_71 ? _GEN_5 : enable; // @[AXIStreamMaster.scala 71:27:@213.8]
  assign _T_80 = 2'h2 == state; // @[Conditional.scala 37:30:@227.8]
  assign _GEN_10 = _T_80 ? 2'h0 : state; // @[Conditional.scala 39:67:@228.8]
  assign _GEN_11 = _T_80 ? 1'h1 : done; // @[Conditional.scala 39:67:@228.8]
  assign _GEN_12 = _T_70 ? _GEN_6 : user; // @[Conditional.scala 39:67:@211.6]
  assign _GEN_13 = _T_70 ? _GEN_7 : length; // @[Conditional.scala 39:67:@211.6]
  assign _GEN_14 = _T_70 ? _GEN_8 : _GEN_10; // @[Conditional.scala 39:67:@211.6]
  assign _GEN_15 = _T_70 ? _GEN_9 : enable; // @[Conditional.scala 39:67:@211.6]
  assign _GEN_16 = _T_70 ? done : _GEN_11; // @[Conditional.scala 39:67:@211.6]
  assign _GEN_17 = _T_66 ? 1'h0 : _GEN_16; // @[Conditional.scala 40:58:@199.4]
  assign _GEN_18 = _T_66 ? io_xfer_valid : _GEN_15; // @[Conditional.scala 40:58:@199.4]
  assign _GEN_19 = _T_66 ? _GEN_0 : _GEN_12; // @[Conditional.scala 40:58:@199.4]
  assign _GEN_20 = _T_66 ? _GEN_1 : _GEN_14; // @[Conditional.scala 40:58:@199.4]
  assign _GEN_21 = _T_66 ? _GEN_2 : _GEN_13; // @[Conditional.scala 40:58:@199.4]
  assign io_bus_tdata = io_dataIO_bits; // @[AXIStreamMaster.scala 50:16:@192.4]
  assign io_bus_tvalid = io_dataIO_valid & enable; // @[AXIStreamMaster.scala 47:17:@190.4]
  assign io_bus_tuser = user; // @[AXIStreamMaster.scala 52:16:@194.4]
  assign io_bus_tlast = length == 32'h1; // @[AXIStreamMaster.scala 51:16:@193.4]
  assign io_dataIO_ready = io_bus_tready & enable; // @[AXIStreamMaster.scala 48:19:@191.4]
  assign io_xfer_done = done; // @[AXIStreamMaster.scala 54:16:@195.4]
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
  user = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  length = _RAND_4[31:0];
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
            if (last) begin
              state <= 2'h2;
            end
          end
        end else begin
          if (_T_80) begin
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
          if (_T_80) begin
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
            if (last) begin
              enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      user <= 1'h0;
    end else begin
      if (_T_66) begin
        if (io_xfer_valid) begin
          user <= io_xfer_first;
        end
      end else begin
        if (_T_70) begin
          if (_T_71) begin
            user <= 1'h0;
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
            length <= _T_76;
          end
        end
      end
    end
  end
endmodule
module CSRAXI_WB_AXIS( // @[:@233.2]
  output [31:0] io_csr_0_dataOut, // @[:@236.4]
  output        io_csr_0_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_0_dataIn, // @[:@236.4]
  input  [31:0] io_csr_1_dataIn, // @[:@236.4]
  output [31:0] io_csr_2_dataOut, // @[:@236.4]
  output        io_csr_2_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_2_dataIn, // @[:@236.4]
  output [31:0] io_csr_3_dataOut, // @[:@236.4]
  output        io_csr_3_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_3_dataIn, // @[:@236.4]
  output [31:0] io_csr_4_dataOut, // @[:@236.4]
  output        io_csr_4_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_4_dataIn, // @[:@236.4]
  output [31:0] io_csr_5_dataOut, // @[:@236.4]
  output        io_csr_5_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_5_dataIn, // @[:@236.4]
  output [31:0] io_csr_6_dataOut, // @[:@236.4]
  output        io_csr_6_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_6_dataIn, // @[:@236.4]
  output [31:0] io_csr_7_dataOut, // @[:@236.4]
  output        io_csr_7_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_7_dataIn, // @[:@236.4]
  output [31:0] io_csr_8_dataOut, // @[:@236.4]
  output        io_csr_8_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_8_dataIn, // @[:@236.4]
  output [31:0] io_csr_9_dataOut, // @[:@236.4]
  output        io_csr_9_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_9_dataIn, // @[:@236.4]
  output [31:0] io_csr_10_dataOut, // @[:@236.4]
  output        io_csr_10_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_10_dataIn, // @[:@236.4]
  output [31:0] io_csr_11_dataOut, // @[:@236.4]
  output        io_csr_11_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_11_dataIn, // @[:@236.4]
  input  [31:0] io_csr_12_dataIn, // @[:@236.4]
  input  [31:0] io_csr_13_dataIn, // @[:@236.4]
  output [31:0] io_csr_14_dataOut, // @[:@236.4]
  output        io_csr_14_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_14_dataIn, // @[:@236.4]
  output [31:0] io_csr_15_dataOut, // @[:@236.4]
  output        io_csr_15_dataWrite, // @[:@236.4]
  input  [31:0] io_csr_15_dataIn, // @[:@236.4]
  input  [3:0]  io_bus_addr, // @[:@236.4]
  input  [31:0] io_bus_dataOut, // @[:@236.4]
  output [31:0] io_bus_dataIn, // @[:@236.4]
  input         io_bus_write, // @[:@236.4]
  input         io_bus_read // @[:@236.4]
);
  wire  _T_178; // @[CSR.scala 32:22:@241.4]
  wire  _T_179; // @[CSR.scala 32:30:@242.4]
  wire [31:0] _GEN_0; // @[CSR.scala 32:45:@243.4]
  wire  _T_184; // @[CSR.scala 39:30:@251.4]
  wire  _T_189; // @[CSR.scala 32:22:@260.4]
  wire  _T_190; // @[CSR.scala 32:30:@261.4]
  wire [31:0] _GEN_4; // @[CSR.scala 32:45:@262.4]
  wire  _T_200; // @[CSR.scala 32:22:@279.4]
  wire  _T_201; // @[CSR.scala 32:30:@280.4]
  wire [31:0] _GEN_8; // @[CSR.scala 32:45:@281.4]
  wire  _T_206; // @[CSR.scala 39:30:@289.4]
  wire  _T_211; // @[CSR.scala 32:22:@298.4]
  wire  _T_212; // @[CSR.scala 32:30:@299.4]
  wire [31:0] _GEN_12; // @[CSR.scala 32:45:@300.4]
  wire  _T_217; // @[CSR.scala 39:30:@308.4]
  wire  _T_222; // @[CSR.scala 32:22:@317.4]
  wire  _T_223; // @[CSR.scala 32:30:@318.4]
  wire [31:0] _GEN_16; // @[CSR.scala 32:45:@319.4]
  wire  _T_228; // @[CSR.scala 39:30:@327.4]
  wire  _T_233; // @[CSR.scala 32:22:@336.4]
  wire  _T_234; // @[CSR.scala 32:30:@337.4]
  wire [31:0] _GEN_20; // @[CSR.scala 32:45:@338.4]
  wire  _T_239; // @[CSR.scala 39:30:@346.4]
  wire  _T_244; // @[CSR.scala 32:22:@355.4]
  wire  _T_245; // @[CSR.scala 32:30:@356.4]
  wire [31:0] _GEN_24; // @[CSR.scala 32:45:@357.4]
  wire  _T_250; // @[CSR.scala 39:30:@365.4]
  wire  _T_255; // @[CSR.scala 32:22:@374.4]
  wire  _T_256; // @[CSR.scala 32:30:@375.4]
  wire [31:0] _GEN_28; // @[CSR.scala 32:45:@376.4]
  wire  _T_261; // @[CSR.scala 39:30:@384.4]
  wire  _T_266; // @[CSR.scala 32:22:@393.4]
  wire  _T_267; // @[CSR.scala 32:30:@394.4]
  wire [31:0] _GEN_32; // @[CSR.scala 32:45:@395.4]
  wire  _T_272; // @[CSR.scala 39:30:@403.4]
  wire  _T_277; // @[CSR.scala 32:22:@412.4]
  wire  _T_278; // @[CSR.scala 32:30:@413.4]
  wire [31:0] _GEN_36; // @[CSR.scala 32:45:@414.4]
  wire  _T_283; // @[CSR.scala 39:30:@422.4]
  wire  _T_288; // @[CSR.scala 32:22:@431.4]
  wire  _T_289; // @[CSR.scala 32:30:@432.4]
  wire [31:0] _GEN_40; // @[CSR.scala 32:45:@433.4]
  wire  _T_294; // @[CSR.scala 39:30:@441.4]
  wire  _T_299; // @[CSR.scala 32:22:@450.4]
  wire  _T_300; // @[CSR.scala 32:30:@451.4]
  wire [31:0] _GEN_44; // @[CSR.scala 32:45:@452.4]
  wire  _T_305; // @[CSR.scala 39:30:@460.4]
  wire  _T_310; // @[CSR.scala 32:22:@469.4]
  wire  _T_311; // @[CSR.scala 32:30:@470.4]
  wire [31:0] _GEN_48; // @[CSR.scala 32:45:@471.4]
  wire  _T_321; // @[CSR.scala 32:22:@488.4]
  wire  _T_322; // @[CSR.scala 32:30:@489.4]
  wire [31:0] _GEN_52; // @[CSR.scala 32:45:@490.4]
  wire  _T_332; // @[CSR.scala 32:22:@507.4]
  wire  _T_333; // @[CSR.scala 32:30:@508.4]
  wire [31:0] _GEN_56; // @[CSR.scala 32:45:@509.4]
  wire  _T_338; // @[CSR.scala 39:30:@517.4]
  wire  _T_343; // @[CSR.scala 32:22:@526.4]
  wire  _T_344; // @[CSR.scala 32:30:@527.4]
  wire  _T_349; // @[CSR.scala 39:30:@536.4]
  assign _T_178 = io_bus_addr == 4'h0; // @[CSR.scala 32:22:@241.4]
  assign _T_179 = _T_178 & io_bus_read; // @[CSR.scala 32:30:@242.4]
  assign _GEN_0 = _T_179 ? io_csr_0_dataIn : 32'h0; // @[CSR.scala 32:45:@243.4]
  assign _T_184 = _T_178 & io_bus_write; // @[CSR.scala 39:30:@251.4]
  assign _T_189 = io_bus_addr == 4'h1; // @[CSR.scala 32:22:@260.4]
  assign _T_190 = _T_189 & io_bus_read; // @[CSR.scala 32:30:@261.4]
  assign _GEN_4 = _T_190 ? io_csr_1_dataIn : _GEN_0; // @[CSR.scala 32:45:@262.4]
  assign _T_200 = io_bus_addr == 4'h2; // @[CSR.scala 32:22:@279.4]
  assign _T_201 = _T_200 & io_bus_read; // @[CSR.scala 32:30:@280.4]
  assign _GEN_8 = _T_201 ? io_csr_2_dataIn : _GEN_4; // @[CSR.scala 32:45:@281.4]
  assign _T_206 = _T_200 & io_bus_write; // @[CSR.scala 39:30:@289.4]
  assign _T_211 = io_bus_addr == 4'h3; // @[CSR.scala 32:22:@298.4]
  assign _T_212 = _T_211 & io_bus_read; // @[CSR.scala 32:30:@299.4]
  assign _GEN_12 = _T_212 ? io_csr_3_dataIn : _GEN_8; // @[CSR.scala 32:45:@300.4]
  assign _T_217 = _T_211 & io_bus_write; // @[CSR.scala 39:30:@308.4]
  assign _T_222 = io_bus_addr == 4'h4; // @[CSR.scala 32:22:@317.4]
  assign _T_223 = _T_222 & io_bus_read; // @[CSR.scala 32:30:@318.4]
  assign _GEN_16 = _T_223 ? io_csr_4_dataIn : _GEN_12; // @[CSR.scala 32:45:@319.4]
  assign _T_228 = _T_222 & io_bus_write; // @[CSR.scala 39:30:@327.4]
  assign _T_233 = io_bus_addr == 4'h5; // @[CSR.scala 32:22:@336.4]
  assign _T_234 = _T_233 & io_bus_read; // @[CSR.scala 32:30:@337.4]
  assign _GEN_20 = _T_234 ? io_csr_5_dataIn : _GEN_16; // @[CSR.scala 32:45:@338.4]
  assign _T_239 = _T_233 & io_bus_write; // @[CSR.scala 39:30:@346.4]
  assign _T_244 = io_bus_addr == 4'h6; // @[CSR.scala 32:22:@355.4]
  assign _T_245 = _T_244 & io_bus_read; // @[CSR.scala 32:30:@356.4]
  assign _GEN_24 = _T_245 ? io_csr_6_dataIn : _GEN_20; // @[CSR.scala 32:45:@357.4]
  assign _T_250 = _T_244 & io_bus_write; // @[CSR.scala 39:30:@365.4]
  assign _T_255 = io_bus_addr == 4'h7; // @[CSR.scala 32:22:@374.4]
  assign _T_256 = _T_255 & io_bus_read; // @[CSR.scala 32:30:@375.4]
  assign _GEN_28 = _T_256 ? io_csr_7_dataIn : _GEN_24; // @[CSR.scala 32:45:@376.4]
  assign _T_261 = _T_255 & io_bus_write; // @[CSR.scala 39:30:@384.4]
  assign _T_266 = io_bus_addr == 4'h8; // @[CSR.scala 32:22:@393.4]
  assign _T_267 = _T_266 & io_bus_read; // @[CSR.scala 32:30:@394.4]
  assign _GEN_32 = _T_267 ? io_csr_8_dataIn : _GEN_28; // @[CSR.scala 32:45:@395.4]
  assign _T_272 = _T_266 & io_bus_write; // @[CSR.scala 39:30:@403.4]
  assign _T_277 = io_bus_addr == 4'h9; // @[CSR.scala 32:22:@412.4]
  assign _T_278 = _T_277 & io_bus_read; // @[CSR.scala 32:30:@413.4]
  assign _GEN_36 = _T_278 ? io_csr_9_dataIn : _GEN_32; // @[CSR.scala 32:45:@414.4]
  assign _T_283 = _T_277 & io_bus_write; // @[CSR.scala 39:30:@422.4]
  assign _T_288 = io_bus_addr == 4'ha; // @[CSR.scala 32:22:@431.4]
  assign _T_289 = _T_288 & io_bus_read; // @[CSR.scala 32:30:@432.4]
  assign _GEN_40 = _T_289 ? io_csr_10_dataIn : _GEN_36; // @[CSR.scala 32:45:@433.4]
  assign _T_294 = _T_288 & io_bus_write; // @[CSR.scala 39:30:@441.4]
  assign _T_299 = io_bus_addr == 4'hb; // @[CSR.scala 32:22:@450.4]
  assign _T_300 = _T_299 & io_bus_read; // @[CSR.scala 32:30:@451.4]
  assign _GEN_44 = _T_300 ? io_csr_11_dataIn : _GEN_40; // @[CSR.scala 32:45:@452.4]
  assign _T_305 = _T_299 & io_bus_write; // @[CSR.scala 39:30:@460.4]
  assign _T_310 = io_bus_addr == 4'hc; // @[CSR.scala 32:22:@469.4]
  assign _T_311 = _T_310 & io_bus_read; // @[CSR.scala 32:30:@470.4]
  assign _GEN_48 = _T_311 ? io_csr_12_dataIn : _GEN_44; // @[CSR.scala 32:45:@471.4]
  assign _T_321 = io_bus_addr == 4'hd; // @[CSR.scala 32:22:@488.4]
  assign _T_322 = _T_321 & io_bus_read; // @[CSR.scala 32:30:@489.4]
  assign _GEN_52 = _T_322 ? io_csr_13_dataIn : _GEN_48; // @[CSR.scala 32:45:@490.4]
  assign _T_332 = io_bus_addr == 4'he; // @[CSR.scala 32:22:@507.4]
  assign _T_333 = _T_332 & io_bus_read; // @[CSR.scala 32:30:@508.4]
  assign _GEN_56 = _T_333 ? io_csr_14_dataIn : _GEN_52; // @[CSR.scala 32:45:@509.4]
  assign _T_338 = _T_332 & io_bus_write; // @[CSR.scala 39:30:@517.4]
  assign _T_343 = io_bus_addr == 4'hf; // @[CSR.scala 32:22:@526.4]
  assign _T_344 = _T_343 & io_bus_read; // @[CSR.scala 32:30:@527.4]
  assign _T_349 = _T_343 & io_bus_write; // @[CSR.scala 39:30:@536.4]
  assign io_csr_0_dataOut = _T_184 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@253.6 CSR.scala 44:25:@258.6]
  assign io_csr_0_dataWrite = _T_178 & io_bus_write; // @[CSR.scala 41:27:@254.6 CSR.scala 43:27:@257.6]
  assign io_csr_2_dataOut = _T_206 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@291.6 CSR.scala 44:25:@296.6]
  assign io_csr_2_dataWrite = _T_200 & io_bus_write; // @[CSR.scala 41:27:@292.6 CSR.scala 43:27:@295.6]
  assign io_csr_3_dataOut = _T_217 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@310.6 CSR.scala 44:25:@315.6]
  assign io_csr_3_dataWrite = _T_211 & io_bus_write; // @[CSR.scala 41:27:@311.6 CSR.scala 43:27:@314.6]
  assign io_csr_4_dataOut = _T_228 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@329.6 CSR.scala 44:25:@334.6]
  assign io_csr_4_dataWrite = _T_222 & io_bus_write; // @[CSR.scala 41:27:@330.6 CSR.scala 43:27:@333.6]
  assign io_csr_5_dataOut = _T_239 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@348.6 CSR.scala 44:25:@353.6]
  assign io_csr_5_dataWrite = _T_233 & io_bus_write; // @[CSR.scala 41:27:@349.6 CSR.scala 43:27:@352.6]
  assign io_csr_6_dataOut = _T_250 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@367.6 CSR.scala 44:25:@372.6]
  assign io_csr_6_dataWrite = _T_244 & io_bus_write; // @[CSR.scala 41:27:@368.6 CSR.scala 43:27:@371.6]
  assign io_csr_7_dataOut = _T_261 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@386.6 CSR.scala 44:25:@391.6]
  assign io_csr_7_dataWrite = _T_255 & io_bus_write; // @[CSR.scala 41:27:@387.6 CSR.scala 43:27:@390.6]
  assign io_csr_8_dataOut = _T_272 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@405.6 CSR.scala 44:25:@410.6]
  assign io_csr_8_dataWrite = _T_266 & io_bus_write; // @[CSR.scala 41:27:@406.6 CSR.scala 43:27:@409.6]
  assign io_csr_9_dataOut = _T_283 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@424.6 CSR.scala 44:25:@429.6]
  assign io_csr_9_dataWrite = _T_277 & io_bus_write; // @[CSR.scala 41:27:@425.6 CSR.scala 43:27:@428.6]
  assign io_csr_10_dataOut = _T_294 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@443.6 CSR.scala 44:25:@448.6]
  assign io_csr_10_dataWrite = _T_288 & io_bus_write; // @[CSR.scala 41:27:@444.6 CSR.scala 43:27:@447.6]
  assign io_csr_11_dataOut = _T_305 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@462.6 CSR.scala 44:25:@467.6]
  assign io_csr_11_dataWrite = _T_299 & io_bus_write; // @[CSR.scala 41:27:@463.6 CSR.scala 43:27:@466.6]
  assign io_csr_14_dataOut = _T_338 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@519.6 CSR.scala 44:25:@524.6]
  assign io_csr_14_dataWrite = _T_332 & io_bus_write; // @[CSR.scala 41:27:@520.6 CSR.scala 43:27:@523.6]
  assign io_csr_15_dataOut = _T_349 ? io_bus_dataOut : 32'h0; // @[CSR.scala 40:25:@538.6 CSR.scala 44:25:@543.6]
  assign io_csr_15_dataWrite = _T_343 & io_bus_write; // @[CSR.scala 41:27:@539.6 CSR.scala 43:27:@542.6]
  assign io_bus_dataIn = _T_344 ? io_csr_15_dataIn : _GEN_56; // @[CSR.scala 29:17:@240.4]
endmodule
module AddressGeneratorAXI_WB_AXIS( // @[:@546.2]
  input         clock, // @[:@547.4]
  input         reset, // @[:@548.4]
  input         io_ctl_start, // @[:@549.4]
  output        io_ctl_busy, // @[:@549.4]
  input  [31:0] io_ctl_startAddress, // @[:@549.4]
  input  [31:0] io_ctl_lineLength, // @[:@549.4]
  input  [31:0] io_ctl_lineCount, // @[:@549.4]
  input  [31:0] io_ctl_lineGap, // @[:@549.4]
  input         io_xfer_done, // @[:@549.4]
  output [31:0] io_xfer_address, // @[:@549.4]
  output [31:0] io_xfer_length, // @[:@549.4]
  output        io_xfer_valid, // @[:@549.4]
  output        io_xfer_first // @[:@549.4]
);
  reg [1:0] state; // @[AddressGenerator.scala 29:22:@551.4]
  reg [31:0] _RAND_0;
  reg [31:0] lineCount; // @[AddressGenerator.scala 31:26:@552.4]
  reg [31:0] _RAND_1;
  reg [31:0] lineGap; // @[AddressGenerator.scala 32:24:@553.4]
  reg [31:0] _RAND_2;
  reg [31:0] address_o; // @[AddressGenerator.scala 34:26:@554.4]
  reg [31:0] _RAND_3;
  reg [31:0] address_i; // @[AddressGenerator.scala 35:26:@555.4]
  reg [31:0] _RAND_4;
  reg [31:0] length_o; // @[AddressGenerator.scala 36:25:@556.4]
  reg [31:0] _RAND_5;
  reg [31:0] length_i; // @[AddressGenerator.scala 37:25:@557.4]
  reg [31:0] _RAND_6;
  reg  valid; // @[AddressGenerator.scala 38:22:@558.4]
  reg [31:0] _RAND_7;
  reg  first; // @[AddressGenerator.scala 39:22:@559.4]
  reg [31:0] _RAND_8;
  reg  busy; // @[AddressGenerator.scala 40:21:@560.4]
  reg [31:0] _RAND_9;
  wire  _T_46; // @[AddressGenerator.scala 48:14:@566.4]
  wire  _GEN_0; // @[AddressGenerator.scala 48:24:@567.4]
  wire  _T_49; // @[Conditional.scala 37:30:@573.4]
  wire [1:0] _GEN_1; // @[AddressGenerator.scala 56:25:@575.6]
  wire [31:0] _GEN_2; // @[AddressGenerator.scala 56:25:@575.6]
  wire [31:0] _GEN_3; // @[AddressGenerator.scala 56:25:@575.6]
  wire [31:0] _GEN_4; // @[AddressGenerator.scala 56:25:@575.6]
  wire [31:0] _GEN_5; // @[AddressGenerator.scala 56:25:@575.6]
  wire  _GEN_6; // @[AddressGenerator.scala 56:25:@575.6]
  wire  _T_51; // @[Conditional.scala 37:30:@585.6]
  wire [34:0] _T_54; // @[AddressGenerator.scala 71:42:@590.8]
  wire [34:0] _GEN_28; // @[AddressGenerator.scala 71:30:@591.8]
  wire [35:0] _T_55; // @[AddressGenerator.scala 71:30:@591.8]
  wire [34:0] _T_56; // @[AddressGenerator.scala 71:30:@592.8]
  wire [34:0] _T_58; // @[AddressGenerator.scala 71:74:@593.8]
  wire [35:0] _T_59; // @[AddressGenerator.scala 71:63:@594.8]
  wire [34:0] _T_60; // @[AddressGenerator.scala 71:63:@595.8]
  wire [32:0] _T_62; // @[AddressGenerator.scala 73:30:@597.8]
  wire [32:0] _T_63; // @[AddressGenerator.scala 73:30:@598.8]
  wire [31:0] _T_64; // @[AddressGenerator.scala 73:30:@599.8]
  wire  _T_65; // @[Conditional.scala 37:30:@604.8]
  wire  _T_69; // @[AddressGenerator.scala 80:24:@609.12]
  wire [1:0] _GEN_7; // @[AddressGenerator.scala 80:30:@610.12]
  wire [1:0] _GEN_8; // @[AddressGenerator.scala 79:25:@608.10]
  wire  _GEN_9; // @[Conditional.scala 39:67:@605.8]
  wire  _GEN_10; // @[Conditional.scala 39:67:@605.8]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@605.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@586.6]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@586.6]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@586.6]
  wire [34:0] _GEN_15; // @[Conditional.scala 39:67:@586.6]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@586.6]
  wire [1:0] _GEN_17; // @[Conditional.scala 39:67:@586.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@586.6]
  wire [1:0] _GEN_19; // @[Conditional.scala 40:58:@574.4]
  wire [34:0] _GEN_20; // @[Conditional.scala 40:58:@574.4]
  wire [31:0] _GEN_21; // @[Conditional.scala 40:58:@574.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@574.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@574.4]
  wire  _GEN_24; // @[Conditional.scala 40:58:@574.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@574.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@574.4]
  wire [31:0] _GEN_27; // @[Conditional.scala 40:58:@574.4]
  assign _T_46 = state == 2'h0; // @[AddressGenerator.scala 48:14:@566.4]
  assign _GEN_0 = _T_46 ? 1'h0 : 1'h1; // @[AddressGenerator.scala 48:24:@567.4]
  assign _T_49 = 2'h0 == state; // @[Conditional.scala 37:30:@573.4]
  assign _GEN_1 = io_ctl_start ? 2'h1 : state; // @[AddressGenerator.scala 56:25:@575.6]
  assign _GEN_2 = io_ctl_start ? io_ctl_startAddress : address_i; // @[AddressGenerator.scala 56:25:@575.6]
  assign _GEN_3 = io_ctl_start ? io_ctl_lineLength : length_i; // @[AddressGenerator.scala 56:25:@575.6]
  assign _GEN_4 = io_ctl_start ? io_ctl_lineCount : lineCount; // @[AddressGenerator.scala 56:25:@575.6]
  assign _GEN_5 = io_ctl_start ? io_ctl_lineGap : lineGap; // @[AddressGenerator.scala 56:25:@575.6]
  assign _GEN_6 = io_ctl_start ? 1'h1 : first; // @[AddressGenerator.scala 56:25:@575.6]
  assign _T_51 = 2'h1 == state; // @[Conditional.scala 37:30:@585.6]
  assign _T_54 = length_i * 32'h4; // @[AddressGenerator.scala 71:42:@590.8]
  assign _GEN_28 = {{3'd0}, address_i}; // @[AddressGenerator.scala 71:30:@591.8]
  assign _T_55 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@591.8]
  assign _T_56 = _GEN_28 + _T_54; // @[AddressGenerator.scala 71:30:@592.8]
  assign _T_58 = lineGap * 32'h4; // @[AddressGenerator.scala 71:74:@593.8]
  assign _T_59 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@594.8]
  assign _T_60 = _T_56 + _T_58; // @[AddressGenerator.scala 71:63:@595.8]
  assign _T_62 = lineCount - 32'h1; // @[AddressGenerator.scala 73:30:@597.8]
  assign _T_63 = $unsigned(_T_62); // @[AddressGenerator.scala 73:30:@598.8]
  assign _T_64 = _T_63[31:0]; // @[AddressGenerator.scala 73:30:@599.8]
  assign _T_65 = 2'h2 == state; // @[Conditional.scala 37:30:@604.8]
  assign _T_69 = lineCount > 32'h0; // @[AddressGenerator.scala 80:24:@609.12]
  assign _GEN_7 = _T_69 ? 2'h1 : 2'h0; // @[AddressGenerator.scala 80:30:@610.12]
  assign _GEN_8 = io_xfer_done ? _GEN_7 : state; // @[AddressGenerator.scala 79:25:@608.10]
  assign _GEN_9 = _T_65 ? 1'h0 : valid; // @[Conditional.scala 39:67:@605.8]
  assign _GEN_10 = _T_65 ? 1'h0 : first; // @[Conditional.scala 39:67:@605.8]
  assign _GEN_11 = _T_65 ? _GEN_8 : state; // @[Conditional.scala 39:67:@605.8]
  assign _GEN_12 = _T_51 ? 1'h1 : _GEN_9; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_13 = _T_51 ? address_i : address_o; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_14 = _T_51 ? length_i : length_o; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_15 = _T_51 ? _T_60 : {{3'd0}, address_i}; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_16 = _T_51 ? _T_64 : lineCount; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_17 = _T_51 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_18 = _T_51 ? first : _GEN_10; // @[Conditional.scala 39:67:@586.6]
  assign _GEN_19 = _T_49 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_20 = _T_49 ? {{3'd0}, _GEN_2} : _GEN_15; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_21 = _T_49 ? _GEN_3 : length_i; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_22 = _T_49 ? _GEN_4 : _GEN_16; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_23 = _T_49 ? _GEN_5 : lineGap; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_24 = _T_49 ? _GEN_6 : _GEN_18; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_25 = _T_49 ? valid : _GEN_12; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_26 = _T_49 ? address_o : _GEN_13; // @[Conditional.scala 40:58:@574.4]
  assign _GEN_27 = _T_49 ? length_o : _GEN_14; // @[Conditional.scala 40:58:@574.4]
  assign io_ctl_busy = busy; // @[AddressGenerator.scala 46:15:@565.4]
  assign io_xfer_address = address_o; // @[AddressGenerator.scala 42:19:@561.4]
  assign io_xfer_length = length_o; // @[AddressGenerator.scala 43:18:@562.4]
  assign io_xfer_valid = valid; // @[AddressGenerator.scala 44:17:@563.4]
  assign io_xfer_first = first; // @[AddressGenerator.scala 45:17:@564.4]
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
  first = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  busy = _RAND_9[0:0];
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
      first <= 1'h0;
    end else begin
      if (_T_49) begin
        if (io_ctl_start) begin
          first <= 1'h1;
        end
      end else begin
        if (!(_T_51)) begin
          if (_T_65) begin
            first <= 1'h0;
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
module TransferSplitterAXI_WB_AXIS( // @[:@619.2]
  input         clock, // @[:@620.4]
  input         reset, // @[:@621.4]
  output        io_xferIn_done, // @[:@622.4]
  input  [31:0] io_xferIn_address, // @[:@622.4]
  input  [31:0] io_xferIn_length, // @[:@622.4]
  input         io_xferIn_valid, // @[:@622.4]
  input         io_xferOut_done, // @[:@622.4]
  output [31:0] io_xferOut_address, // @[:@622.4]
  output [31:0] io_xferOut_length, // @[:@622.4]
  output        io_xferOut_valid // @[:@622.4]
);
  reg [31:0] _T_42; // @[TransferSplitter.scala 35:28:@624.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_45; // @[TransferSplitter.scala 36:27:@625.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_48; // @[TransferSplitter.scala 38:28:@626.4]
  reg [31:0] _RAND_2;
  reg [31:0] _T_51; // @[TransferSplitter.scala 39:27:@627.4]
  reg [31:0] _RAND_3;
  reg  _T_60; // @[TransferSplitter.scala 44:23:@630.4]
  reg [31:0] _RAND_4;
  reg  _T_63; // @[TransferSplitter.scala 45:24:@631.4]
  reg [31:0] _RAND_5;
  reg [1:0] _T_65; // @[TransferSplitter.scala 47:24:@632.4]
  reg [31:0] _RAND_6;
  wire  _T_66; // @[Conditional.scala 37:30:@638.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 60:31:@641.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 60:31:@641.6]
  wire [1:0] _GEN_3; // @[TransferSplitter.scala 60:31:@641.6]
  wire  _T_68; // @[Conditional.scala 37:30:@649.6]
  wire  _T_71; // @[TransferSplitter.scala 73:23:@655.8]
  wire [32:0] _T_74; // @[TransferSplitter.scala 76:34:@658.10]
  wire [32:0] _T_75; // @[TransferSplitter.scala 76:34:@659.10]
  wire [31:0] _T_76; // @[TransferSplitter.scala 76:34:@660.10]
  wire [11:0] _T_79; // @[TransferSplitter.scala 77:50:@662.10]
  wire [31:0] _GEN_33; // @[TransferSplitter.scala 77:36:@663.10]
  wire [32:0] _T_80; // @[TransferSplitter.scala 77:36:@663.10]
  wire [31:0] _T_81; // @[TransferSplitter.scala 77:36:@664.10]
  wire [34:0] _T_84; // @[TransferSplitter.scala 95:47:@670.10]
  wire [34:0] _GEN_34; // @[TransferSplitter.scala 95:36:@671.10]
  wire [35:0] _T_85; // @[TransferSplitter.scala 95:36:@671.10]
  wire [34:0] _T_86; // @[TransferSplitter.scala 95:36:@672.10]
  wire [31:0] _GEN_4; // @[TransferSplitter.scala 73:38:@656.8]
  wire [31:0] _GEN_5; // @[TransferSplitter.scala 73:38:@656.8]
  wire [34:0] _GEN_6; // @[TransferSplitter.scala 73:38:@656.8]
  wire  _T_87; // @[Conditional.scala 37:30:@677.8]
  wire  _T_91; // @[TransferSplitter.scala 114:25:@682.12]
  wire [1:0] _GEN_7; // @[TransferSplitter.scala 114:32:@683.12]
  wire  _GEN_8; // @[TransferSplitter.scala 114:32:@683.12]
  wire [1:0] _GEN_9; // @[TransferSplitter.scala 113:31:@681.10]
  wire  _GEN_10; // @[TransferSplitter.scala 113:31:@681.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@678.8]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@678.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@678.8]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@650.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@650.6]
  wire [1:0] _GEN_18; // @[Conditional.scala 39:67:@650.6]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@650.6]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@650.6]
  wire [34:0] _GEN_21; // @[Conditional.scala 39:67:@650.6]
  wire  _GEN_23; // @[Conditional.scala 39:67:@650.6]
  wire  _GEN_24; // @[Conditional.scala 40:58:@639.4]
  wire [34:0] _GEN_25; // @[Conditional.scala 40:58:@639.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@639.4]
  wire [1:0] _GEN_28; // @[Conditional.scala 40:58:@639.4]
  wire [31:0] _GEN_29; // @[Conditional.scala 40:58:@639.4]
  wire  _GEN_31; // @[Conditional.scala 40:58:@639.4]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58:@639.4]
  assign _T_66 = 2'h0 == _T_65; // @[Conditional.scala 37:30:@638.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_42; // @[TransferSplitter.scala 60:31:@641.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_45; // @[TransferSplitter.scala 60:31:@641.6]
  assign _GEN_3 = io_xferIn_valid ? 2'h1 : _T_65; // @[TransferSplitter.scala 60:31:@641.6]
  assign _T_68 = 2'h1 == _T_65; // @[Conditional.scala 37:30:@649.6]
  assign _T_71 = _T_45 > 32'h100; // @[TransferSplitter.scala 73:23:@655.8]
  assign _T_74 = _T_45 - 32'h100; // @[TransferSplitter.scala 76:34:@658.10]
  assign _T_75 = $unsigned(_T_74); // @[TransferSplitter.scala 76:34:@659.10]
  assign _T_76 = _T_75[31:0]; // @[TransferSplitter.scala 76:34:@660.10]
  assign _T_79 = 9'h100 * 9'h4; // @[TransferSplitter.scala 77:50:@662.10]
  assign _GEN_33 = {{20'd0}, _T_79}; // @[TransferSplitter.scala 77:36:@663.10]
  assign _T_80 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@663.10]
  assign _T_81 = _T_42 + _GEN_33; // @[TransferSplitter.scala 77:36:@664.10]
  assign _T_84 = _T_45 * 32'h4; // @[TransferSplitter.scala 95:47:@670.10]
  assign _GEN_34 = {{3'd0}, _T_42}; // @[TransferSplitter.scala 95:36:@671.10]
  assign _T_85 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@671.10]
  assign _T_86 = _GEN_34 + _T_84; // @[TransferSplitter.scala 95:36:@672.10]
  assign _GEN_4 = _T_71 ? 32'h100 : _T_45; // @[TransferSplitter.scala 73:38:@656.8]
  assign _GEN_5 = _T_71 ? _T_76 : 32'h0; // @[TransferSplitter.scala 73:38:@656.8]
  assign _GEN_6 = _T_71 ? {{3'd0}, _T_81} : _T_86; // @[TransferSplitter.scala 73:38:@656.8]
  assign _T_87 = 2'h2 == _T_65; // @[Conditional.scala 37:30:@677.8]
  assign _T_91 = _T_45 > 32'h0; // @[TransferSplitter.scala 114:25:@682.12]
  assign _GEN_7 = _T_91 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 114:32:@683.12]
  assign _GEN_8 = _T_91 ? _T_60 : 1'h1; // @[TransferSplitter.scala 114:32:@683.12]
  assign _GEN_9 = io_xferOut_done ? _GEN_7 : _T_65; // @[TransferSplitter.scala 113:31:@681.10]
  assign _GEN_10 = io_xferOut_done ? _GEN_8 : _T_60; // @[TransferSplitter.scala 113:31:@681.10]
  assign _GEN_11 = _T_87 ? 1'h0 : _T_63; // @[Conditional.scala 39:67:@678.8]
  assign _GEN_13 = _T_87 ? _GEN_9 : _T_65; // @[Conditional.scala 39:67:@678.8]
  assign _GEN_14 = _T_87 ? _GEN_10 : _T_60; // @[Conditional.scala 39:67:@678.8]
  assign _GEN_15 = _T_68 ? _T_42 : _T_48; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_17 = _T_68 ? 1'h1 : _GEN_11; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_18 = _T_68 ? 2'h2 : _GEN_13; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_19 = _T_68 ? _GEN_4 : _T_51; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_20 = _T_68 ? _GEN_5 : _T_45; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_21 = _T_68 ? _GEN_6 : {{3'd0}, _T_42}; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_23 = _T_68 ? _T_60 : _GEN_14; // @[Conditional.scala 39:67:@650.6]
  assign _GEN_24 = _T_66 ? 1'h0 : _GEN_23; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_25 = _T_66 ? {{3'd0}, _GEN_0} : _GEN_21; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_26 = _T_66 ? _GEN_1 : _GEN_20; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_28 = _T_66 ? _GEN_3 : _GEN_18; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_29 = _T_66 ? _T_48 : _GEN_15; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_31 = _T_66 ? _T_63 : _GEN_17; // @[Conditional.scala 40:58:@639.4]
  assign _GEN_32 = _T_66 ? _T_51 : _GEN_19; // @[Conditional.scala 40:58:@639.4]
  assign io_xferIn_done = _T_60; // @[TransferSplitter.scala 49:20:@633.4]
  assign io_xferOut_address = _T_48; // @[TransferSplitter.scala 53:24:@636.4]
  assign io_xferOut_length = _T_51; // @[TransferSplitter.scala 54:23:@637.4]
  assign io_xferOut_valid = _T_63; // @[TransferSplitter.scala 50:22:@634.4]
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
module TransferSplitterAXI_WB_AXIS_1( // @[:@766.2]
  output        io_xferIn_done, // @[:@769.4]
  input  [31:0] io_xferIn_length, // @[:@769.4]
  input         io_xferIn_valid, // @[:@769.4]
  input         io_xferIn_first, // @[:@769.4]
  input         io_xferOut_done, // @[:@769.4]
  output [31:0] io_xferOut_length, // @[:@769.4]
  output        io_xferOut_valid, // @[:@769.4]
  output        io_xferOut_first // @[:@769.4]
);
  assign io_xferIn_done = io_xferOut_done; // @[TransferSplitter.scala 124:16:@775.4]
  assign io_xferOut_length = io_xferIn_length; // @[TransferSplitter.scala 124:16:@773.4]
  assign io_xferOut_valid = io_xferIn_valid; // @[TransferSplitter.scala 124:16:@772.4]
  assign io_xferOut_first = io_xferIn_first; // @[TransferSplitter.scala 124:16:@771.4]
endmodule
module ClearCSRAXI_WB_AXIS( // @[:@777.2]
  input         clock, // @[:@778.4]
  input         reset, // @[:@779.4]
  input  [31:0] io_csr_dataOut, // @[:@780.4]
  input         io_csr_dataWrite, // @[:@780.4]
  output [31:0] io_csr_dataIn, // @[:@780.4]
  output [31:0] io_value, // @[:@780.4]
  input  [31:0] io_clear // @[:@780.4]
);
  reg [31:0] reg$; // @[ClearCSR.scala 28:20:@782.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[ClearCSR.scala 36:19:@789.6]
  wire [31:0] _T_30; // @[ClearCSR.scala 36:16:@790.6]
  wire [31:0] _GEN_0; // @[ClearCSR.scala 33:25:@785.4]
  assign _T_29 = ~ io_clear; // @[ClearCSR.scala 36:19:@789.6]
  assign _T_30 = reg$ & _T_29; // @[ClearCSR.scala 36:16:@790.6]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : _T_30; // @[ClearCSR.scala 33:25:@785.4]
  assign io_csr_dataIn = reg$; // @[ClearCSR.scala 30:17:@783.4]
  assign io_value = reg$; // @[ClearCSR.scala 31:12:@784.4]
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
module StatusCSRAXI_WB_AXIS( // @[:@794.2]
  input         clock, // @[:@795.4]
  output [31:0] io_csr_dataIn, // @[:@797.4]
  input  [31:0] io_value // @[:@797.4]
);
  reg [31:0] reg$; // @[StatusCSR.scala 27:20:@799.4]
  reg [31:0] _RAND_0;
  assign io_csr_dataIn = reg$; // @[StatusCSR.scala 29:17:@801.4]
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
module SimpleCSRAXI_WB_AXIS( // @[:@803.2]
  input         clock, // @[:@804.4]
  input         reset, // @[:@805.4]
  input  [31:0] io_csr_dataOut, // @[:@806.4]
  input         io_csr_dataWrite, // @[:@806.4]
  output [31:0] io_csr_dataIn, // @[:@806.4]
  output [31:0] io_value // @[:@806.4]
);
  reg [31:0] reg$; // @[SimpleCSR.scala 27:20:@808.4]
  reg [31:0] _RAND_0;
  wire [31:0] _GEN_0; // @[SimpleCSR.scala 32:25:@811.4]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : reg$; // @[SimpleCSR.scala 32:25:@811.4]
  assign io_csr_dataIn = reg$; // @[SimpleCSR.scala 29:17:@809.4]
  assign io_value = reg$; // @[SimpleCSR.scala 30:12:@810.4]
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
module SetCSRAXI_WB_AXIS( // @[:@815.2]
  input         clock, // @[:@816.4]
  input         reset, // @[:@817.4]
  input  [31:0] io_csr_dataOut, // @[:@818.4]
  input         io_csr_dataWrite, // @[:@818.4]
  output [31:0] io_csr_dataIn, // @[:@818.4]
  output [31:0] io_value, // @[:@818.4]
  input  [31:0] io_set // @[:@818.4]
);
  reg [31:0] reg$; // @[SetCSR.scala 28:20:@820.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[SetCSR.scala 34:20:@824.6]
  wire [31:0] _T_30; // @[SetCSR.scala 34:17:@825.6]
  wire [31:0] _T_31; // @[SetCSR.scala 34:45:@826.6]
  wire [31:0] _T_32; // @[SetCSR.scala 36:16:@830.6]
  wire [31:0] _GEN_0; // @[SetCSR.scala 33:25:@823.4]
  assign _T_29 = ~ io_csr_dataOut; // @[SetCSR.scala 34:20:@824.6]
  assign _T_30 = reg$ & _T_29; // @[SetCSR.scala 34:17:@825.6]
  assign _T_31 = _T_30 | io_set; // @[SetCSR.scala 34:45:@826.6]
  assign _T_32 = reg$ | io_set; // @[SetCSR.scala 36:16:@830.6]
  assign _GEN_0 = io_csr_dataWrite ? _T_31 : _T_32; // @[SetCSR.scala 33:25:@823.4]
  assign io_csr_dataIn = reg$; // @[SetCSR.scala 30:17:@821.4]
  assign io_value = reg$; // @[SetCSR.scala 31:12:@822.4]
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
module InterruptControllerAXI_WB_AXIS( // @[:@834.2]
  input         clock, // @[:@835.4]
  input         reset, // @[:@836.4]
  output        io_irq_readerDone, // @[:@837.4]
  output        io_irq_writerDone, // @[:@837.4]
  input         io_readBusy, // @[:@837.4]
  input         io_writeBusy, // @[:@837.4]
  input  [31:0] io_imr_dataOut, // @[:@837.4]
  input         io_imr_dataWrite, // @[:@837.4]
  output [31:0] io_imr_dataIn, // @[:@837.4]
  input  [31:0] io_isr_dataOut, // @[:@837.4]
  input         io_isr_dataWrite, // @[:@837.4]
  output [31:0] io_isr_dataIn // @[:@837.4]
);
  wire  SimpleCSRAXI_WB_AXIS_clock; // @[SimpleCSR.scala 40:21:@839.4]
  wire  SimpleCSRAXI_WB_AXIS_reset; // @[SimpleCSR.scala 40:21:@839.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@839.4]
  wire  SimpleCSRAXI_WB_AXIS_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@839.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@839.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_value; // @[SimpleCSR.scala 40:21:@839.4]
  wire  SetCSRAXI_WB_AXIS_clock; // @[SetCSR.scala 43:21:@871.4]
  wire  SetCSRAXI_WB_AXIS_reset; // @[SetCSR.scala 43:21:@871.4]
  wire [31:0] SetCSRAXI_WB_AXIS_io_csr_dataOut; // @[SetCSR.scala 43:21:@871.4]
  wire  SetCSRAXI_WB_AXIS_io_csr_dataWrite; // @[SetCSR.scala 43:21:@871.4]
  wire [31:0] SetCSRAXI_WB_AXIS_io_csr_dataIn; // @[SetCSR.scala 43:21:@871.4]
  wire [31:0] SetCSRAXI_WB_AXIS_io_value; // @[SetCSR.scala 43:21:@871.4]
  wire [31:0] SetCSRAXI_WB_AXIS_io_set; // @[SetCSR.scala 43:21:@871.4]
  reg  readBusy; // @[InterruptController.scala 33:25:@848.4]
  reg [31:0] _RAND_0;
  reg  readBusyOld; // @[InterruptController.scala 34:28:@850.4]
  reg [31:0] _RAND_1;
  reg  writeBusy; // @[InterruptController.scala 36:26:@852.4]
  reg [31:0] _RAND_2;
  reg  writeBusyOld; // @[InterruptController.scala 37:29:@854.4]
  reg [31:0] _RAND_3;
  reg  writeBusyIrq; // @[InterruptController.scala 39:29:@856.4]
  reg [31:0] _RAND_4;
  reg  readBusyIrq; // @[InterruptController.scala 40:28:@857.4]
  reg [31:0] _RAND_5;
  wire  _T_59; // @[InterruptController.scala 42:35:@858.4]
  wire  _T_60; // @[InterruptController.scala 42:32:@859.4]
  wire [31:0] mask; // @[:@846.4 :@847.4]
  wire  _T_61; // @[InterruptController.scala 42:53:@860.4]
  wire  _T_62; // @[InterruptController.scala 42:46:@861.4]
  wire  _T_64; // @[InterruptController.scala 43:33:@863.4]
  wire  _T_65; // @[InterruptController.scala 43:30:@864.4]
  wire  _T_66; // @[InterruptController.scala 43:50:@865.4]
  wire  _T_67; // @[InterruptController.scala 43:43:@866.4]
  wire [1:0] irq; // @[Cat.scala 30:58:@868.4]
  wire [31:0] isr; // @[:@879.4 :@880.4]
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS ( // @[SimpleCSR.scala 40:21:@839.4]
    .clock(SimpleCSRAXI_WB_AXIS_clock),
    .reset(SimpleCSRAXI_WB_AXIS_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_io_value)
  );
  SetCSRAXI_WB_AXIS SetCSRAXI_WB_AXIS ( // @[SetCSR.scala 43:21:@871.4]
    .clock(SetCSRAXI_WB_AXIS_clock),
    .reset(SetCSRAXI_WB_AXIS_reset),
    .io_csr_dataOut(SetCSRAXI_WB_AXIS_io_csr_dataOut),
    .io_csr_dataWrite(SetCSRAXI_WB_AXIS_io_csr_dataWrite),
    .io_csr_dataIn(SetCSRAXI_WB_AXIS_io_csr_dataIn),
    .io_value(SetCSRAXI_WB_AXIS_io_value),
    .io_set(SetCSRAXI_WB_AXIS_io_set)
  );
  assign _T_59 = writeBusy == 1'h0; // @[InterruptController.scala 42:35:@858.4]
  assign _T_60 = writeBusyOld & _T_59; // @[InterruptController.scala 42:32:@859.4]
  assign mask = SimpleCSRAXI_WB_AXIS_io_value; // @[:@846.4 :@847.4]
  assign _T_61 = mask[0]; // @[InterruptController.scala 42:53:@860.4]
  assign _T_62 = _T_60 & _T_61; // @[InterruptController.scala 42:46:@861.4]
  assign _T_64 = readBusy == 1'h0; // @[InterruptController.scala 43:33:@863.4]
  assign _T_65 = readBusyOld & _T_64; // @[InterruptController.scala 43:30:@864.4]
  assign _T_66 = mask[1]; // @[InterruptController.scala 43:50:@865.4]
  assign _T_67 = _T_65 & _T_66; // @[InterruptController.scala 43:43:@866.4]
  assign irq = {readBusyIrq,writeBusyIrq}; // @[Cat.scala 30:58:@868.4]
  assign isr = SetCSRAXI_WB_AXIS_io_value; // @[:@879.4 :@880.4]
  assign io_irq_readerDone = isr[1]; // @[InterruptController.scala 50:21:@884.4]
  assign io_irq_writerDone = isr[0]; // @[InterruptController.scala 49:21:@882.4]
  assign io_imr_dataIn = SimpleCSRAXI_WB_AXIS_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@842.4]
  assign io_isr_dataIn = SetCSRAXI_WB_AXIS_io_csr_dataIn; // @[SetCSR.scala 47:16:@875.4]
  assign SimpleCSRAXI_WB_AXIS_clock = clock; // @[:@840.4]
  assign SimpleCSRAXI_WB_AXIS_reset = reset; // @[:@841.4]
  assign SimpleCSRAXI_WB_AXIS_io_csr_dataOut = io_imr_dataOut; // @[SimpleCSR.scala 42:16:@844.4]
  assign SimpleCSRAXI_WB_AXIS_io_csr_dataWrite = io_imr_dataWrite; // @[SimpleCSR.scala 42:16:@843.4]
  assign SetCSRAXI_WB_AXIS_clock = clock; // @[:@872.4]
  assign SetCSRAXI_WB_AXIS_reset = reset; // @[:@873.4]
  assign SetCSRAXI_WB_AXIS_io_csr_dataOut = io_isr_dataOut; // @[SetCSR.scala 47:16:@877.4]
  assign SetCSRAXI_WB_AXIS_io_csr_dataWrite = io_isr_dataWrite; // @[SetCSR.scala 47:16:@876.4]
  assign SetCSRAXI_WB_AXIS_io_set = {{30'd0}, irq}; // @[SetCSR.scala 45:16:@874.4]
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
module WorkerCSRWrapperAXI_WB_AXIS( // @[:@1024.2]
  input         clock, // @[:@1025.4]
  input         reset, // @[:@1026.4]
  input  [31:0] io_csr_0_dataOut, // @[:@1027.4]
  input         io_csr_0_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_0_dataIn, // @[:@1027.4]
  output [31:0] io_csr_1_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_2_dataOut, // @[:@1027.4]
  input         io_csr_2_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_2_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_3_dataOut, // @[:@1027.4]
  input         io_csr_3_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_3_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_4_dataOut, // @[:@1027.4]
  input         io_csr_4_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_4_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_5_dataOut, // @[:@1027.4]
  input         io_csr_5_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_5_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_6_dataOut, // @[:@1027.4]
  input         io_csr_6_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_6_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_7_dataOut, // @[:@1027.4]
  input         io_csr_7_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_7_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_8_dataOut, // @[:@1027.4]
  input         io_csr_8_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_8_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_9_dataOut, // @[:@1027.4]
  input         io_csr_9_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_9_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_10_dataOut, // @[:@1027.4]
  input         io_csr_10_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_10_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_11_dataOut, // @[:@1027.4]
  input         io_csr_11_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_11_dataIn, // @[:@1027.4]
  output [31:0] io_csr_12_dataIn, // @[:@1027.4]
  output [31:0] io_csr_13_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_14_dataOut, // @[:@1027.4]
  input         io_csr_14_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_14_dataIn, // @[:@1027.4]
  input  [31:0] io_csr_15_dataOut, // @[:@1027.4]
  input         io_csr_15_dataWrite, // @[:@1027.4]
  output [31:0] io_csr_15_dataIn, // @[:@1027.4]
  output        io_irq_readerDone, // @[:@1027.4]
  output        io_irq_writerDone, // @[:@1027.4]
  input         io_sync_readerSync, // @[:@1027.4]
  input         io_sync_writerSync, // @[:@1027.4]
  input         io_xferRead_done, // @[:@1027.4]
  output [31:0] io_xferRead_address, // @[:@1027.4]
  output [31:0] io_xferRead_length, // @[:@1027.4]
  output        io_xferRead_valid, // @[:@1027.4]
  input         io_xferWrite_done, // @[:@1027.4]
  output [31:0] io_xferWrite_length, // @[:@1027.4]
  output        io_xferWrite_valid, // @[:@1027.4]
  output        io_xferWrite_first // @[:@1027.4]
);
  wire  inputAddressGeneratorRead_clock; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_reset; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_io_ctl_start; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_io_ctl_busy; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_io_xfer_done; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire [31:0] inputAddressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  inputAddressGeneratorRead_io_xfer_first; // @[WorkerCSRWrapper.scala 33:41:@1029.4]
  wire  transferSplitterRead_clock; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  transferSplitterRead_reset; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire [31:0] transferSplitterRead_io_xferIn_address; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire [31:0] transferSplitterRead_io_xferIn_length; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  transferSplitterRead_io_xferIn_valid; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  transferSplitterRead_io_xferOut_done; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire [31:0] transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire [31:0] transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 34:36:@1032.4]
  wire  inputAddressGeneratorWrite_clock; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_reset; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_io_ctl_start; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_io_ctl_busy; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_io_xfer_done; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire [31:0] inputAddressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  inputAddressGeneratorWrite_io_xfer_first; // @[WorkerCSRWrapper.scala 36:42:@1035.4]
  wire  transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire [31:0] transferSplitterWrite_io_xferIn_length; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  transferSplitterWrite_io_xferIn_valid; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  transferSplitterWrite_io_xferIn_first; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  transferSplitterWrite_io_xferOut_done; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire [31:0] transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  transferSplitterWrite_io_xferOut_first; // @[WorkerCSRWrapper.scala 37:37:@1038.4]
  wire  ClearCSRAXI_WB_AXIS_clock; // @[ClearCSR.scala 42:21:@1058.4]
  wire  ClearCSRAXI_WB_AXIS_reset; // @[ClearCSR.scala 42:21:@1058.4]
  wire [31:0] ClearCSRAXI_WB_AXIS_io_csr_dataOut; // @[ClearCSR.scala 42:21:@1058.4]
  wire  ClearCSRAXI_WB_AXIS_io_csr_dataWrite; // @[ClearCSR.scala 42:21:@1058.4]
  wire [31:0] ClearCSRAXI_WB_AXIS_io_csr_dataIn; // @[ClearCSR.scala 42:21:@1058.4]
  wire [31:0] ClearCSRAXI_WB_AXIS_io_value; // @[ClearCSR.scala 42:21:@1058.4]
  wire [31:0] ClearCSRAXI_WB_AXIS_io_clear; // @[ClearCSR.scala 42:21:@1058.4]
  wire  StatusCSRAXI_WB_AXIS_clock; // @[StatusCSR.scala 34:21:@1067.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1067.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_io_value; // @[StatusCSR.scala 34:21:@1067.4]
  wire  InterruptControllerAXI_WB_AXIS_clock; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_reset; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_irq_readerDone; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_irq_writerDone; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_readBusy; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_writeBusy; // @[InterruptController.scala 55:22:@1075.4]
  wire [31:0] InterruptControllerAXI_WB_AXIS_io_imr_dataOut; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_imr_dataWrite; // @[InterruptController.scala 55:22:@1075.4]
  wire [31:0] InterruptControllerAXI_WB_AXIS_io_imr_dataIn; // @[InterruptController.scala 55:22:@1075.4]
  wire [31:0] InterruptControllerAXI_WB_AXIS_io_isr_dataOut; // @[InterruptController.scala 55:22:@1075.4]
  wire  InterruptControllerAXI_WB_AXIS_io_isr_dataWrite; // @[InterruptController.scala 55:22:@1075.4]
  wire [31:0] InterruptControllerAXI_WB_AXIS_io_isr_dataIn; // @[InterruptController.scala 55:22:@1075.4]
  wire  SimpleCSRAXI_WB_AXIS_clock; // @[SimpleCSR.scala 40:21:@1112.4]
  wire  SimpleCSRAXI_WB_AXIS_reset; // @[SimpleCSR.scala 40:21:@1112.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1112.4]
  wire  SimpleCSRAXI_WB_AXIS_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1112.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1112.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_io_value; // @[SimpleCSR.scala 40:21:@1112.4]
  wire  SimpleCSRAXI_WB_AXIS_1_clock; // @[SimpleCSR.scala 40:21:@1120.4]
  wire  SimpleCSRAXI_WB_AXIS_1_reset; // @[SimpleCSR.scala 40:21:@1120.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_1_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1120.4]
  wire  SimpleCSRAXI_WB_AXIS_1_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1120.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_1_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1120.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_1_io_value; // @[SimpleCSR.scala 40:21:@1120.4]
  wire  SimpleCSRAXI_WB_AXIS_2_clock; // @[SimpleCSR.scala 40:21:@1128.4]
  wire  SimpleCSRAXI_WB_AXIS_2_reset; // @[SimpleCSR.scala 40:21:@1128.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_2_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1128.4]
  wire  SimpleCSRAXI_WB_AXIS_2_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1128.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_2_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1128.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_2_io_value; // @[SimpleCSR.scala 40:21:@1128.4]
  wire  SimpleCSRAXI_WB_AXIS_3_clock; // @[SimpleCSR.scala 40:21:@1136.4]
  wire  SimpleCSRAXI_WB_AXIS_3_reset; // @[SimpleCSR.scala 40:21:@1136.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_3_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1136.4]
  wire  SimpleCSRAXI_WB_AXIS_3_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1136.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_3_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1136.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_3_io_value; // @[SimpleCSR.scala 40:21:@1136.4]
  wire  SimpleCSRAXI_WB_AXIS_4_clock; // @[SimpleCSR.scala 40:21:@1145.4]
  wire  SimpleCSRAXI_WB_AXIS_4_reset; // @[SimpleCSR.scala 40:21:@1145.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_4_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1145.4]
  wire  SimpleCSRAXI_WB_AXIS_4_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1145.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_4_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1145.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_4_io_value; // @[SimpleCSR.scala 40:21:@1145.4]
  wire  SimpleCSRAXI_WB_AXIS_5_clock; // @[SimpleCSR.scala 40:21:@1153.4]
  wire  SimpleCSRAXI_WB_AXIS_5_reset; // @[SimpleCSR.scala 40:21:@1153.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_5_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1153.4]
  wire  SimpleCSRAXI_WB_AXIS_5_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1153.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_5_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1153.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_5_io_value; // @[SimpleCSR.scala 40:21:@1153.4]
  wire  SimpleCSRAXI_WB_AXIS_6_clock; // @[SimpleCSR.scala 40:21:@1161.4]
  wire  SimpleCSRAXI_WB_AXIS_6_reset; // @[SimpleCSR.scala 40:21:@1161.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_6_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1161.4]
  wire  SimpleCSRAXI_WB_AXIS_6_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1161.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_6_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1161.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_6_io_value; // @[SimpleCSR.scala 40:21:@1161.4]
  wire  SimpleCSRAXI_WB_AXIS_7_clock; // @[SimpleCSR.scala 40:21:@1169.4]
  wire  SimpleCSRAXI_WB_AXIS_7_reset; // @[SimpleCSR.scala 40:21:@1169.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_7_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1169.4]
  wire  SimpleCSRAXI_WB_AXIS_7_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1169.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_7_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1169.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_7_io_value; // @[SimpleCSR.scala 40:21:@1169.4]
  wire  StatusCSRAXI_WB_AXIS_1_clock; // @[StatusCSR.scala 34:21:@1177.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_1_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1177.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_1_io_value; // @[StatusCSR.scala 34:21:@1177.4]
  wire  StatusCSRAXI_WB_AXIS_2_clock; // @[StatusCSR.scala 34:21:@1185.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_2_io_csr_dataIn; // @[StatusCSR.scala 34:21:@1185.4]
  wire [31:0] StatusCSRAXI_WB_AXIS_2_io_value; // @[StatusCSR.scala 34:21:@1185.4]
  wire  SimpleCSRAXI_WB_AXIS_8_clock; // @[SimpleCSR.scala 40:21:@1193.4]
  wire  SimpleCSRAXI_WB_AXIS_8_reset; // @[SimpleCSR.scala 40:21:@1193.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_8_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1193.4]
  wire  SimpleCSRAXI_WB_AXIS_8_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1193.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_8_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1193.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_8_io_value; // @[SimpleCSR.scala 40:21:@1193.4]
  wire  SimpleCSRAXI_WB_AXIS_9_clock; // @[SimpleCSR.scala 40:21:@1200.4]
  wire  SimpleCSRAXI_WB_AXIS_9_reset; // @[SimpleCSR.scala 40:21:@1200.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_9_io_csr_dataOut; // @[SimpleCSR.scala 40:21:@1200.4]
  wire  SimpleCSRAXI_WB_AXIS_9_io_csr_dataWrite; // @[SimpleCSR.scala 40:21:@1200.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_9_io_csr_dataIn; // @[SimpleCSR.scala 40:21:@1200.4]
  wire [31:0] SimpleCSRAXI_WB_AXIS_9_io_value; // @[SimpleCSR.scala 40:21:@1200.4]
  reg [1:0] status; // @[WorkerCSRWrapper.scala 39:23:@1042.4]
  reg [31:0] _RAND_0;
  reg  readerSync; // @[WorkerCSRWrapper.scala 41:27:@1044.4]
  reg [31:0] _RAND_1;
  reg  readerSyncOld; // @[WorkerCSRWrapper.scala 42:30:@1046.4]
  reg [31:0] _RAND_2;
  reg  writerSync; // @[WorkerCSRWrapper.scala 44:27:@1048.4]
  reg [31:0] _RAND_3;
  reg  writerSyncOld; // @[WorkerCSRWrapper.scala 45:30:@1050.4]
  reg [31:0] _RAND_4;
  reg  readerStart; // @[WorkerCSRWrapper.scala 47:28:@1052.4]
  reg [31:0] _RAND_5;
  reg  writerStart; // @[WorkerCSRWrapper.scala 48:28:@1053.4]
  reg [31:0] _RAND_6;
  wire [1:0] _T_207; // @[Cat.scala 30:58:@1090.4]
  wire [31:0] control; // @[WorkerCSRWrapper.scala 50:21:@1054.4 WorkerCSRWrapper.scala 59:11:@1066.4]
  wire  _T_208; // @[WorkerCSRWrapper.scala 66:56:@1091.4]
  wire  _T_209; // @[WorkerCSRWrapper.scala 66:68:@1092.4]
  wire [1:0] _T_210; // @[Cat.scala 30:58:@1093.4]
  wire [1:0] _T_211; // @[WorkerCSRWrapper.scala 66:44:@1094.4]
  wire [1:0] clear; // @[WorkerCSRWrapper.scala 66:42:@1095.4]
  wire  _T_214; // @[WorkerCSRWrapper.scala 68:20:@1097.4]
  wire  _T_215; // @[WorkerCSRWrapper.scala 68:35:@1098.4]
  wire  _T_216; // @[WorkerCSRWrapper.scala 68:60:@1099.4]
  wire  _T_217; // @[WorkerCSRWrapper.scala 68:50:@1100.4]
  wire  _T_218; // @[WorkerCSRWrapper.scala 68:75:@1101.4]
  wire  _T_219; // @[WorkerCSRWrapper.scala 68:65:@1102.4]
  wire  _T_221; // @[WorkerCSRWrapper.scala 69:20:@1104.4]
  wire  _T_222; // @[WorkerCSRWrapper.scala 69:35:@1105.4]
  wire  _T_223; // @[WorkerCSRWrapper.scala 69:60:@1106.4]
  wire  _T_224; // @[WorkerCSRWrapper.scala 69:50:@1107.4]
  wire  _T_225; // @[WorkerCSRWrapper.scala 69:75:@1108.4]
  wire  _T_226; // @[WorkerCSRWrapper.scala 69:65:@1109.4]
  AddressGeneratorAXI_WB_AXIS inputAddressGeneratorRead ( // @[WorkerCSRWrapper.scala 33:41:@1029.4]
    .clock(inputAddressGeneratorRead_clock),
    .reset(inputAddressGeneratorRead_reset),
    .io_ctl_start(inputAddressGeneratorRead_io_ctl_start),
    .io_ctl_busy(inputAddressGeneratorRead_io_ctl_busy),
    .io_ctl_startAddress(inputAddressGeneratorRead_io_ctl_startAddress),
    .io_ctl_lineLength(inputAddressGeneratorRead_io_ctl_lineLength),
    .io_ctl_lineCount(inputAddressGeneratorRead_io_ctl_lineCount),
    .io_ctl_lineGap(inputAddressGeneratorRead_io_ctl_lineGap),
    .io_xfer_done(inputAddressGeneratorRead_io_xfer_done),
    .io_xfer_address(inputAddressGeneratorRead_io_xfer_address),
    .io_xfer_length(inputAddressGeneratorRead_io_xfer_length),
    .io_xfer_valid(inputAddressGeneratorRead_io_xfer_valid),
    .io_xfer_first(inputAddressGeneratorRead_io_xfer_first)
  );
  TransferSplitterAXI_WB_AXIS transferSplitterRead ( // @[WorkerCSRWrapper.scala 34:36:@1032.4]
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
  AddressGeneratorAXI_WB_AXIS inputAddressGeneratorWrite ( // @[WorkerCSRWrapper.scala 36:42:@1035.4]
    .clock(inputAddressGeneratorWrite_clock),
    .reset(inputAddressGeneratorWrite_reset),
    .io_ctl_start(inputAddressGeneratorWrite_io_ctl_start),
    .io_ctl_busy(inputAddressGeneratorWrite_io_ctl_busy),
    .io_ctl_startAddress(inputAddressGeneratorWrite_io_ctl_startAddress),
    .io_ctl_lineLength(inputAddressGeneratorWrite_io_ctl_lineLength),
    .io_ctl_lineCount(inputAddressGeneratorWrite_io_ctl_lineCount),
    .io_ctl_lineGap(inputAddressGeneratorWrite_io_ctl_lineGap),
    .io_xfer_done(inputAddressGeneratorWrite_io_xfer_done),
    .io_xfer_address(inputAddressGeneratorWrite_io_xfer_address),
    .io_xfer_length(inputAddressGeneratorWrite_io_xfer_length),
    .io_xfer_valid(inputAddressGeneratorWrite_io_xfer_valid),
    .io_xfer_first(inputAddressGeneratorWrite_io_xfer_first)
  );
  TransferSplitterAXI_WB_AXIS_1 transferSplitterWrite ( // @[WorkerCSRWrapper.scala 37:37:@1038.4]
    .io_xferIn_done(transferSplitterWrite_io_xferIn_done),
    .io_xferIn_length(transferSplitterWrite_io_xferIn_length),
    .io_xferIn_valid(transferSplitterWrite_io_xferIn_valid),
    .io_xferIn_first(transferSplitterWrite_io_xferIn_first),
    .io_xferOut_done(transferSplitterWrite_io_xferOut_done),
    .io_xferOut_length(transferSplitterWrite_io_xferOut_length),
    .io_xferOut_valid(transferSplitterWrite_io_xferOut_valid),
    .io_xferOut_first(transferSplitterWrite_io_xferOut_first)
  );
  ClearCSRAXI_WB_AXIS ClearCSRAXI_WB_AXIS ( // @[ClearCSR.scala 42:21:@1058.4]
    .clock(ClearCSRAXI_WB_AXIS_clock),
    .reset(ClearCSRAXI_WB_AXIS_reset),
    .io_csr_dataOut(ClearCSRAXI_WB_AXIS_io_csr_dataOut),
    .io_csr_dataWrite(ClearCSRAXI_WB_AXIS_io_csr_dataWrite),
    .io_csr_dataIn(ClearCSRAXI_WB_AXIS_io_csr_dataIn),
    .io_value(ClearCSRAXI_WB_AXIS_io_value),
    .io_clear(ClearCSRAXI_WB_AXIS_io_clear)
  );
  StatusCSRAXI_WB_AXIS StatusCSRAXI_WB_AXIS ( // @[StatusCSR.scala 34:21:@1067.4]
    .clock(StatusCSRAXI_WB_AXIS_clock),
    .io_csr_dataIn(StatusCSRAXI_WB_AXIS_io_csr_dataIn),
    .io_value(StatusCSRAXI_WB_AXIS_io_value)
  );
  InterruptControllerAXI_WB_AXIS InterruptControllerAXI_WB_AXIS ( // @[InterruptController.scala 55:22:@1075.4]
    .clock(InterruptControllerAXI_WB_AXIS_clock),
    .reset(InterruptControllerAXI_WB_AXIS_reset),
    .io_irq_readerDone(InterruptControllerAXI_WB_AXIS_io_irq_readerDone),
    .io_irq_writerDone(InterruptControllerAXI_WB_AXIS_io_irq_writerDone),
    .io_readBusy(InterruptControllerAXI_WB_AXIS_io_readBusy),
    .io_writeBusy(InterruptControllerAXI_WB_AXIS_io_writeBusy),
    .io_imr_dataOut(InterruptControllerAXI_WB_AXIS_io_imr_dataOut),
    .io_imr_dataWrite(InterruptControllerAXI_WB_AXIS_io_imr_dataWrite),
    .io_imr_dataIn(InterruptControllerAXI_WB_AXIS_io_imr_dataIn),
    .io_isr_dataOut(InterruptControllerAXI_WB_AXIS_io_isr_dataOut),
    .io_isr_dataWrite(InterruptControllerAXI_WB_AXIS_io_isr_dataWrite),
    .io_isr_dataIn(InterruptControllerAXI_WB_AXIS_io_isr_dataIn)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS ( // @[SimpleCSR.scala 40:21:@1112.4]
    .clock(SimpleCSRAXI_WB_AXIS_clock),
    .reset(SimpleCSRAXI_WB_AXIS_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_1 ( // @[SimpleCSR.scala 40:21:@1120.4]
    .clock(SimpleCSRAXI_WB_AXIS_1_clock),
    .reset(SimpleCSRAXI_WB_AXIS_1_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_1_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_1_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_1_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_1_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_2 ( // @[SimpleCSR.scala 40:21:@1128.4]
    .clock(SimpleCSRAXI_WB_AXIS_2_clock),
    .reset(SimpleCSRAXI_WB_AXIS_2_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_2_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_2_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_2_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_2_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_3 ( // @[SimpleCSR.scala 40:21:@1136.4]
    .clock(SimpleCSRAXI_WB_AXIS_3_clock),
    .reset(SimpleCSRAXI_WB_AXIS_3_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_3_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_3_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_3_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_3_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_4 ( // @[SimpleCSR.scala 40:21:@1145.4]
    .clock(SimpleCSRAXI_WB_AXIS_4_clock),
    .reset(SimpleCSRAXI_WB_AXIS_4_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_4_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_4_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_4_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_4_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_5 ( // @[SimpleCSR.scala 40:21:@1153.4]
    .clock(SimpleCSRAXI_WB_AXIS_5_clock),
    .reset(SimpleCSRAXI_WB_AXIS_5_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_5_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_5_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_5_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_5_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_6 ( // @[SimpleCSR.scala 40:21:@1161.4]
    .clock(SimpleCSRAXI_WB_AXIS_6_clock),
    .reset(SimpleCSRAXI_WB_AXIS_6_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_6_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_6_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_6_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_6_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_7 ( // @[SimpleCSR.scala 40:21:@1169.4]
    .clock(SimpleCSRAXI_WB_AXIS_7_clock),
    .reset(SimpleCSRAXI_WB_AXIS_7_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_7_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_7_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_7_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_7_io_value)
  );
  StatusCSRAXI_WB_AXIS StatusCSRAXI_WB_AXIS_1 ( // @[StatusCSR.scala 34:21:@1177.4]
    .clock(StatusCSRAXI_WB_AXIS_1_clock),
    .io_csr_dataIn(StatusCSRAXI_WB_AXIS_1_io_csr_dataIn),
    .io_value(StatusCSRAXI_WB_AXIS_1_io_value)
  );
  StatusCSRAXI_WB_AXIS StatusCSRAXI_WB_AXIS_2 ( // @[StatusCSR.scala 34:21:@1185.4]
    .clock(StatusCSRAXI_WB_AXIS_2_clock),
    .io_csr_dataIn(StatusCSRAXI_WB_AXIS_2_io_csr_dataIn),
    .io_value(StatusCSRAXI_WB_AXIS_2_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_8 ( // @[SimpleCSR.scala 40:21:@1193.4]
    .clock(SimpleCSRAXI_WB_AXIS_8_clock),
    .reset(SimpleCSRAXI_WB_AXIS_8_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_8_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_8_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_8_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_8_io_value)
  );
  SimpleCSRAXI_WB_AXIS SimpleCSRAXI_WB_AXIS_9 ( // @[SimpleCSR.scala 40:21:@1200.4]
    .clock(SimpleCSRAXI_WB_AXIS_9_clock),
    .reset(SimpleCSRAXI_WB_AXIS_9_reset),
    .io_csr_dataOut(SimpleCSRAXI_WB_AXIS_9_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSRAXI_WB_AXIS_9_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSRAXI_WB_AXIS_9_io_csr_dataIn),
    .io_value(SimpleCSRAXI_WB_AXIS_9_io_value)
  );
  assign _T_207 = {readerStart,writerStart}; // @[Cat.scala 30:58:@1090.4]
  assign control = ClearCSRAXI_WB_AXIS_io_value; // @[WorkerCSRWrapper.scala 50:21:@1054.4 WorkerCSRWrapper.scala 59:11:@1066.4]
  assign _T_208 = control[5]; // @[WorkerCSRWrapper.scala 66:56:@1091.4]
  assign _T_209 = control[4]; // @[WorkerCSRWrapper.scala 66:68:@1092.4]
  assign _T_210 = {_T_208,_T_209}; // @[Cat.scala 30:58:@1093.4]
  assign _T_211 = ~ _T_210; // @[WorkerCSRWrapper.scala 66:44:@1094.4]
  assign clear = _T_207 & _T_211; // @[WorkerCSRWrapper.scala 66:42:@1095.4]
  assign _T_214 = readerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 68:20:@1097.4]
  assign _T_215 = _T_214 & readerSync; // @[WorkerCSRWrapper.scala 68:35:@1098.4]
  assign _T_216 = control[3]; // @[WorkerCSRWrapper.scala 68:60:@1099.4]
  assign _T_217 = _T_215 | _T_216; // @[WorkerCSRWrapper.scala 68:50:@1100.4]
  assign _T_218 = control[1]; // @[WorkerCSRWrapper.scala 68:75:@1101.4]
  assign _T_219 = _T_217 & _T_218; // @[WorkerCSRWrapper.scala 68:65:@1102.4]
  assign _T_221 = writerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 69:20:@1104.4]
  assign _T_222 = _T_221 & writerSync; // @[WorkerCSRWrapper.scala 69:35:@1105.4]
  assign _T_223 = control[2]; // @[WorkerCSRWrapper.scala 69:60:@1106.4]
  assign _T_224 = _T_222 | _T_223; // @[WorkerCSRWrapper.scala 69:50:@1107.4]
  assign _T_225 = control[0]; // @[WorkerCSRWrapper.scala 69:75:@1108.4]
  assign _T_226 = _T_224 & _T_225; // @[WorkerCSRWrapper.scala 69:65:@1109.4]
  assign io_csr_0_dataIn = ClearCSRAXI_WB_AXIS_io_csr_dataIn; // @[ClearCSR.scala 46:16:@1062.4]
  assign io_csr_1_dataIn = StatusCSRAXI_WB_AXIS_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1070.4]
  assign io_csr_2_dataIn = InterruptControllerAXI_WB_AXIS_io_imr_dataIn; // @[InterruptController.scala 60:17:@1080.4]
  assign io_csr_3_dataIn = InterruptControllerAXI_WB_AXIS_io_isr_dataIn; // @[InterruptController.scala 61:17:@1084.4]
  assign io_csr_4_dataIn = SimpleCSRAXI_WB_AXIS_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1115.4]
  assign io_csr_5_dataIn = SimpleCSRAXI_WB_AXIS_1_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1123.4]
  assign io_csr_6_dataIn = SimpleCSRAXI_WB_AXIS_2_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1131.4]
  assign io_csr_7_dataIn = SimpleCSRAXI_WB_AXIS_3_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1139.4]
  assign io_csr_8_dataIn = SimpleCSRAXI_WB_AXIS_4_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1148.4]
  assign io_csr_9_dataIn = SimpleCSRAXI_WB_AXIS_5_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1156.4]
  assign io_csr_10_dataIn = SimpleCSRAXI_WB_AXIS_6_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1164.4]
  assign io_csr_11_dataIn = SimpleCSRAXI_WB_AXIS_7_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1172.4]
  assign io_csr_12_dataIn = StatusCSRAXI_WB_AXIS_1_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1180.4]
  assign io_csr_13_dataIn = StatusCSRAXI_WB_AXIS_2_io_csr_dataIn; // @[StatusCSR.scala 36:16:@1188.4]
  assign io_csr_14_dataIn = SimpleCSRAXI_WB_AXIS_8_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1196.4]
  assign io_csr_15_dataIn = SimpleCSRAXI_WB_AXIS_9_io_csr_dataIn; // @[SimpleCSR.scala 42:16:@1203.4]
  assign io_irq_readerDone = InterruptControllerAXI_WB_AXIS_io_irq_readerDone; // @[WorkerCSRWrapper.scala 63:10:@1089.4]
  assign io_irq_writerDone = InterruptControllerAXI_WB_AXIS_io_irq_writerDone; // @[WorkerCSRWrapper.scala 63:10:@1088.4]
  assign io_xferRead_address = transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 91:15:@1215.4]
  assign io_xferRead_length = transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 91:15:@1214.4]
  assign io_xferRead_valid = transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 91:15:@1213.4]
  assign io_xferWrite_length = transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 94:16:@1224.4]
  assign io_xferWrite_valid = transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 94:16:@1223.4]
  assign io_xferWrite_first = transferSplitterWrite_io_xferOut_first; // @[WorkerCSRWrapper.scala 94:16:@1222.4]
  assign inputAddressGeneratorRead_clock = clock; // @[:@1030.4]
  assign inputAddressGeneratorRead_reset = reset; // @[:@1031.4]
  assign inputAddressGeneratorRead_io_ctl_start = readerStart; // @[WorkerCSRWrapper.scala 71:42:@1111.4]
  assign inputAddressGeneratorRead_io_ctl_startAddress = SimpleCSRAXI_WB_AXIS_io_value; // @[WorkerCSRWrapper.scala 72:49:@1119.4]
  assign inputAddressGeneratorRead_io_ctl_lineLength = SimpleCSRAXI_WB_AXIS_1_io_value; // @[WorkerCSRWrapper.scala 73:47:@1127.4]
  assign inputAddressGeneratorRead_io_ctl_lineCount = SimpleCSRAXI_WB_AXIS_2_io_value; // @[WorkerCSRWrapper.scala 74:46:@1135.4]
  assign inputAddressGeneratorRead_io_ctl_lineGap = SimpleCSRAXI_WB_AXIS_3_io_value; // @[WorkerCSRWrapper.scala 75:44:@1143.4]
  assign inputAddressGeneratorRead_io_xfer_done = transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 90:34:@1211.4]
  assign transferSplitterRead_clock = clock; // @[:@1033.4]
  assign transferSplitterRead_reset = reset; // @[:@1034.4]
  assign transferSplitterRead_io_xferIn_address = inputAddressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 90:34:@1210.4]
  assign transferSplitterRead_io_xferIn_length = inputAddressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 90:34:@1209.4]
  assign transferSplitterRead_io_xferIn_valid = inputAddressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 90:34:@1208.4]
  assign transferSplitterRead_io_xferOut_done = io_xferRead_done; // @[WorkerCSRWrapper.scala 91:15:@1216.4]
  assign inputAddressGeneratorWrite_clock = clock; // @[:@1036.4]
  assign inputAddressGeneratorWrite_reset = reset; // @[:@1037.4]
  assign inputAddressGeneratorWrite_io_ctl_start = writerStart; // @[WorkerCSRWrapper.scala 77:43:@1144.4]
  assign inputAddressGeneratorWrite_io_ctl_startAddress = SimpleCSRAXI_WB_AXIS_4_io_value; // @[WorkerCSRWrapper.scala 78:50:@1152.4]
  assign inputAddressGeneratorWrite_io_ctl_lineLength = SimpleCSRAXI_WB_AXIS_5_io_value; // @[WorkerCSRWrapper.scala 79:48:@1160.4]
  assign inputAddressGeneratorWrite_io_ctl_lineCount = SimpleCSRAXI_WB_AXIS_6_io_value; // @[WorkerCSRWrapper.scala 80:47:@1168.4]
  assign inputAddressGeneratorWrite_io_ctl_lineGap = SimpleCSRAXI_WB_AXIS_7_io_value; // @[WorkerCSRWrapper.scala 81:45:@1176.4]
  assign inputAddressGeneratorWrite_io_xfer_done = transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 93:35:@1221.4]
  assign transferSplitterWrite_io_xferIn_length = inputAddressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 93:35:@1219.4]
  assign transferSplitterWrite_io_xferIn_valid = inputAddressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 93:35:@1218.4]
  assign transferSplitterWrite_io_xferIn_first = inputAddressGeneratorWrite_io_xfer_first; // @[WorkerCSRWrapper.scala 93:35:@1217.4]
  assign transferSplitterWrite_io_xferOut_done = io_xferWrite_done; // @[WorkerCSRWrapper.scala 94:16:@1226.4]
  assign ClearCSRAXI_WB_AXIS_clock = clock; // @[:@1059.4]
  assign ClearCSRAXI_WB_AXIS_reset = reset; // @[:@1060.4]
  assign ClearCSRAXI_WB_AXIS_io_csr_dataOut = io_csr_0_dataOut; // @[ClearCSR.scala 46:16:@1064.4]
  assign ClearCSRAXI_WB_AXIS_io_csr_dataWrite = io_csr_0_dataWrite; // @[ClearCSR.scala 46:16:@1063.4]
  assign ClearCSRAXI_WB_AXIS_io_clear = {{30'd0}, clear}; // @[ClearCSR.scala 44:18:@1061.4]
  assign StatusCSRAXI_WB_AXIS_clock = clock; // @[:@1068.4]
  assign StatusCSRAXI_WB_AXIS_io_value = {{30'd0}, status}; // @[StatusCSR.scala 38:18:@1074.4]
  assign InterruptControllerAXI_WB_AXIS_clock = clock; // @[:@1076.4]
  assign InterruptControllerAXI_WB_AXIS_reset = reset; // @[:@1077.4]
  assign InterruptControllerAXI_WB_AXIS_io_readBusy = inputAddressGeneratorRead_io_ctl_busy; // @[InterruptController.scala 57:22:@1078.4]
  assign InterruptControllerAXI_WB_AXIS_io_writeBusy = inputAddressGeneratorWrite_io_ctl_busy; // @[InterruptController.scala 58:23:@1079.4]
  assign InterruptControllerAXI_WB_AXIS_io_imr_dataOut = io_csr_2_dataOut; // @[InterruptController.scala 60:17:@1082.4]
  assign InterruptControllerAXI_WB_AXIS_io_imr_dataWrite = io_csr_2_dataWrite; // @[InterruptController.scala 60:17:@1081.4]
  assign InterruptControllerAXI_WB_AXIS_io_isr_dataOut = io_csr_3_dataOut; // @[InterruptController.scala 61:17:@1086.4]
  assign InterruptControllerAXI_WB_AXIS_io_isr_dataWrite = io_csr_3_dataWrite; // @[InterruptController.scala 61:17:@1085.4]
  assign SimpleCSRAXI_WB_AXIS_clock = clock; // @[:@1113.4]
  assign SimpleCSRAXI_WB_AXIS_reset = reset; // @[:@1114.4]
  assign SimpleCSRAXI_WB_AXIS_io_csr_dataOut = io_csr_4_dataOut; // @[SimpleCSR.scala 42:16:@1117.4]
  assign SimpleCSRAXI_WB_AXIS_io_csr_dataWrite = io_csr_4_dataWrite; // @[SimpleCSR.scala 42:16:@1116.4]
  assign SimpleCSRAXI_WB_AXIS_1_clock = clock; // @[:@1121.4]
  assign SimpleCSRAXI_WB_AXIS_1_reset = reset; // @[:@1122.4]
  assign SimpleCSRAXI_WB_AXIS_1_io_csr_dataOut = io_csr_5_dataOut; // @[SimpleCSR.scala 42:16:@1125.4]
  assign SimpleCSRAXI_WB_AXIS_1_io_csr_dataWrite = io_csr_5_dataWrite; // @[SimpleCSR.scala 42:16:@1124.4]
  assign SimpleCSRAXI_WB_AXIS_2_clock = clock; // @[:@1129.4]
  assign SimpleCSRAXI_WB_AXIS_2_reset = reset; // @[:@1130.4]
  assign SimpleCSRAXI_WB_AXIS_2_io_csr_dataOut = io_csr_6_dataOut; // @[SimpleCSR.scala 42:16:@1133.4]
  assign SimpleCSRAXI_WB_AXIS_2_io_csr_dataWrite = io_csr_6_dataWrite; // @[SimpleCSR.scala 42:16:@1132.4]
  assign SimpleCSRAXI_WB_AXIS_3_clock = clock; // @[:@1137.4]
  assign SimpleCSRAXI_WB_AXIS_3_reset = reset; // @[:@1138.4]
  assign SimpleCSRAXI_WB_AXIS_3_io_csr_dataOut = io_csr_7_dataOut; // @[SimpleCSR.scala 42:16:@1141.4]
  assign SimpleCSRAXI_WB_AXIS_3_io_csr_dataWrite = io_csr_7_dataWrite; // @[SimpleCSR.scala 42:16:@1140.4]
  assign SimpleCSRAXI_WB_AXIS_4_clock = clock; // @[:@1146.4]
  assign SimpleCSRAXI_WB_AXIS_4_reset = reset; // @[:@1147.4]
  assign SimpleCSRAXI_WB_AXIS_4_io_csr_dataOut = io_csr_8_dataOut; // @[SimpleCSR.scala 42:16:@1150.4]
  assign SimpleCSRAXI_WB_AXIS_4_io_csr_dataWrite = io_csr_8_dataWrite; // @[SimpleCSR.scala 42:16:@1149.4]
  assign SimpleCSRAXI_WB_AXIS_5_clock = clock; // @[:@1154.4]
  assign SimpleCSRAXI_WB_AXIS_5_reset = reset; // @[:@1155.4]
  assign SimpleCSRAXI_WB_AXIS_5_io_csr_dataOut = io_csr_9_dataOut; // @[SimpleCSR.scala 42:16:@1158.4]
  assign SimpleCSRAXI_WB_AXIS_5_io_csr_dataWrite = io_csr_9_dataWrite; // @[SimpleCSR.scala 42:16:@1157.4]
  assign SimpleCSRAXI_WB_AXIS_6_clock = clock; // @[:@1162.4]
  assign SimpleCSRAXI_WB_AXIS_6_reset = reset; // @[:@1163.4]
  assign SimpleCSRAXI_WB_AXIS_6_io_csr_dataOut = io_csr_10_dataOut; // @[SimpleCSR.scala 42:16:@1166.4]
  assign SimpleCSRAXI_WB_AXIS_6_io_csr_dataWrite = io_csr_10_dataWrite; // @[SimpleCSR.scala 42:16:@1165.4]
  assign SimpleCSRAXI_WB_AXIS_7_clock = clock; // @[:@1170.4]
  assign SimpleCSRAXI_WB_AXIS_7_reset = reset; // @[:@1171.4]
  assign SimpleCSRAXI_WB_AXIS_7_io_csr_dataOut = io_csr_11_dataOut; // @[SimpleCSR.scala 42:16:@1174.4]
  assign SimpleCSRAXI_WB_AXIS_7_io_csr_dataWrite = io_csr_11_dataWrite; // @[SimpleCSR.scala 42:16:@1173.4]
  assign StatusCSRAXI_WB_AXIS_1_clock = clock; // @[:@1178.4]
  assign StatusCSRAXI_WB_AXIS_1_io_value = 32'h0; // @[StatusCSR.scala 38:18:@1184.4]
  assign StatusCSRAXI_WB_AXIS_2_clock = clock; // @[:@1186.4]
  assign StatusCSRAXI_WB_AXIS_2_io_value = 32'h32; // @[StatusCSR.scala 38:18:@1192.4]
  assign SimpleCSRAXI_WB_AXIS_8_clock = clock; // @[:@1194.4]
  assign SimpleCSRAXI_WB_AXIS_8_reset = reset; // @[:@1195.4]
  assign SimpleCSRAXI_WB_AXIS_8_io_csr_dataOut = io_csr_14_dataOut; // @[SimpleCSR.scala 42:16:@1198.4]
  assign SimpleCSRAXI_WB_AXIS_8_io_csr_dataWrite = io_csr_14_dataWrite; // @[SimpleCSR.scala 42:16:@1197.4]
  assign SimpleCSRAXI_WB_AXIS_9_clock = clock; // @[:@1201.4]
  assign SimpleCSRAXI_WB_AXIS_9_reset = reset; // @[:@1202.4]
  assign SimpleCSRAXI_WB_AXIS_9_io_csr_dataOut = io_csr_15_dataOut; // @[SimpleCSR.scala 42:16:@1205.4]
  assign SimpleCSRAXI_WB_AXIS_9_io_csr_dataWrite = io_csr_15_dataWrite; // @[SimpleCSR.scala 42:16:@1204.4]
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
    status <= {inputAddressGeneratorRead_io_ctl_busy,inputAddressGeneratorWrite_io_ctl_busy};
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
module Queue( // @[:@1228.2]
  input         clock, // @[:@1229.4]
  input         reset, // @[:@1230.4]
  output        io_enq_ready, // @[:@1231.4]
  input         io_enq_valid, // @[:@1231.4]
  input  [31:0] io_enq_bits, // @[:@1231.4]
  input         io_deq_ready, // @[:@1231.4]
  output        io_deq_valid, // @[:@1231.4]
  output [31:0] io_deq_bits // @[:@1231.4]
);
  reg [31:0] ram [0:511]; // @[Decoupled.scala 215:24:@1233.4]
  reg [31:0] _RAND_0;
  wire [31:0] ram__T_63_data; // @[Decoupled.scala 215:24:@1233.4]
  wire [8:0] ram__T_63_addr; // @[Decoupled.scala 215:24:@1233.4]
  wire [31:0] ram__T_49_data; // @[Decoupled.scala 215:24:@1233.4]
  wire [8:0] ram__T_49_addr; // @[Decoupled.scala 215:24:@1233.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 215:24:@1233.4]
  wire  ram__T_49_en; // @[Decoupled.scala 215:24:@1233.4]
  reg [8:0] value; // @[Counter.scala 26:33:@1234.4]
  reg [31:0] _RAND_1;
  reg [8:0] value_1; // @[Counter.scala 26:33:@1235.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 218:35:@1236.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 220:41:@1237.4]
  wire  _T_43; // @[Decoupled.scala 221:36:@1238.4]
  wire  empty; // @[Decoupled.scala 221:33:@1239.4]
  wire  _T_44; // @[Decoupled.scala 222:32:@1240.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@1241.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@1244.4]
  wire [9:0] _T_52; // @[Counter.scala 35:22:@1251.6]
  wire [8:0] _T_53; // @[Counter.scala 35:22:@1252.6]
  wire [8:0] _GEN_5; // @[Decoupled.scala 226:17:@1247.4]
  wire [9:0] _T_56; // @[Counter.scala 35:22:@1257.6]
  wire [8:0] _T_57; // @[Counter.scala 35:22:@1258.6]
  wire [8:0] _GEN_6; // @[Decoupled.scala 230:17:@1255.4]
  wire  _T_58; // @[Decoupled.scala 233:16:@1261.4]
  wire  _GEN_7; // @[Decoupled.scala 233:28:@1262.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 215:24:@1233.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 220:41:@1237.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 221:36:@1238.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 221:33:@1239.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 222:32:@1240.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@1241.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@1244.4]
  assign _T_52 = value + 9'h1; // @[Counter.scala 35:22:@1251.6]
  assign _T_53 = value + 9'h1; // @[Counter.scala 35:22:@1252.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 226:17:@1247.4]
  assign _T_56 = value_1 + 9'h1; // @[Counter.scala 35:22:@1257.6]
  assign _T_57 = value_1 + 9'h1; // @[Counter.scala 35:22:@1258.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 230:17:@1255.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 233:16:@1261.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 233:28:@1262.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 238:16:@1268.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 237:16:@1266.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 239:15:@1270.4]
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
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 215:24:@1233.4]
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
module DMATopAXI_WB_AXIS( // @[:@1279.2]
  input         clock, // @[:@1280.4]
  input         reset, // @[:@1281.4]
  input  [31:0] io_control_dat_i, // @[:@1282.4]
  output [31:0] io_control_dat_o, // @[:@1282.4]
  input         io_control_cyc_i, // @[:@1282.4]
  input         io_control_stb_i, // @[:@1282.4]
  input         io_control_we_i, // @[:@1282.4]
  input  [29:0] io_control_adr_i, // @[:@1282.4]
  input  [3:0]  io_control_sel_i, // @[:@1282.4]
  output        io_control_ack_o, // @[:@1282.4]
  output        io_control_stall_o, // @[:@1282.4]
  output        io_control_err_o, // @[:@1282.4]
  output [3:0]  io_read_aw_awid, // @[:@1282.4]
  output [31:0] io_read_aw_awaddr, // @[:@1282.4]
  output [7:0]  io_read_aw_awlen, // @[:@1282.4]
  output [2:0]  io_read_aw_awsize, // @[:@1282.4]
  output [1:0]  io_read_aw_awburst, // @[:@1282.4]
  output        io_read_aw_awlock, // @[:@1282.4]
  output [3:0]  io_read_aw_awcache, // @[:@1282.4]
  output [2:0]  io_read_aw_awprot, // @[:@1282.4]
  output [3:0]  io_read_aw_awqos, // @[:@1282.4]
  output        io_read_aw_awvalid, // @[:@1282.4]
  input         io_read_aw_awready, // @[:@1282.4]
  output [31:0] io_read_w_wdata, // @[:@1282.4]
  output [3:0]  io_read_w_wstrb, // @[:@1282.4]
  output        io_read_w_wlast, // @[:@1282.4]
  output        io_read_w_wvalid, // @[:@1282.4]
  input         io_read_w_wready, // @[:@1282.4]
  input  [3:0]  io_read_b_bid, // @[:@1282.4]
  input  [1:0]  io_read_b_bresp, // @[:@1282.4]
  input         io_read_b_bvalid, // @[:@1282.4]
  output        io_read_b_bready, // @[:@1282.4]
  output [3:0]  io_read_ar_arid, // @[:@1282.4]
  output [31:0] io_read_ar_araddr, // @[:@1282.4]
  output [7:0]  io_read_ar_arlen, // @[:@1282.4]
  output [2:0]  io_read_ar_arsize, // @[:@1282.4]
  output [1:0]  io_read_ar_arburst, // @[:@1282.4]
  output        io_read_ar_arlock, // @[:@1282.4]
  output [3:0]  io_read_ar_arcache, // @[:@1282.4]
  output [2:0]  io_read_ar_arprot, // @[:@1282.4]
  output [3:0]  io_read_ar_arqos, // @[:@1282.4]
  output        io_read_ar_arvalid, // @[:@1282.4]
  input         io_read_ar_arready, // @[:@1282.4]
  input  [3:0]  io_read_r_rid, // @[:@1282.4]
  input  [31:0] io_read_r_rdata, // @[:@1282.4]
  input  [1:0]  io_read_r_rresp, // @[:@1282.4]
  input         io_read_r_rlast, // @[:@1282.4]
  input         io_read_r_rvalid, // @[:@1282.4]
  output        io_read_r_rready, // @[:@1282.4]
  output [31:0] io_write_tdata, // @[:@1282.4]
  output        io_write_tvalid, // @[:@1282.4]
  input         io_write_tready, // @[:@1282.4]
  output        io_write_tuser, // @[:@1282.4]
  output        io_write_tlast, // @[:@1282.4]
  output        io_irq_readerDone, // @[:@1282.4]
  output        io_irq_writerDone, // @[:@1282.4]
  input         io_sync_readerSync, // @[:@1282.4]
  input         io_sync_writerSync // @[:@1282.4]
);
  wire  csrFrontend_clock; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_reset; // @[DMATop.scala 38:27:@1284.4]
  wire [31:0] csrFrontend_io_ctl_dat_i; // @[DMATop.scala 38:27:@1284.4]
  wire [31:0] csrFrontend_io_ctl_dat_o; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_ctl_cyc_i; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_ctl_stb_i; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_ctl_we_i; // @[DMATop.scala 38:27:@1284.4]
  wire [29:0] csrFrontend_io_ctl_adr_i; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_ctl_ack_o; // @[DMATop.scala 38:27:@1284.4]
  wire [3:0] csrFrontend_io_bus_addr; // @[DMATop.scala 38:27:@1284.4]
  wire [31:0] csrFrontend_io_bus_dataOut; // @[DMATop.scala 38:27:@1284.4]
  wire [31:0] csrFrontend_io_bus_dataIn; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_bus_write; // @[DMATop.scala 38:27:@1284.4]
  wire  csrFrontend_io_bus_read; // @[DMATop.scala 38:27:@1284.4]
  wire  readerFrontend_clock; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_reset; // @[DMATop.scala 40:30:@1287.4]
  wire [31:0] readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 40:30:@1287.4]
  wire [7:0] readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_bus_ar_arready; // @[DMATop.scala 40:30:@1287.4]
  wire [31:0] readerFrontend_io_bus_r_rdata; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_bus_r_rlast; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_bus_r_rvalid; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_bus_r_rready; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_dataIO_ready; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_dataIO_valid; // @[DMATop.scala 40:30:@1287.4]
  wire [31:0] readerFrontend_io_dataIO_bits; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_xfer_done; // @[DMATop.scala 40:30:@1287.4]
  wire [31:0] readerFrontend_io_xfer_address; // @[DMATop.scala 40:30:@1287.4]
  wire [31:0] readerFrontend_io_xfer_length; // @[DMATop.scala 40:30:@1287.4]
  wire  readerFrontend_io_xfer_valid; // @[DMATop.scala 40:30:@1287.4]
  wire  writerFrontend_clock; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_reset; // @[DMATop.scala 42:30:@1290.4]
  wire [31:0] writerFrontend_io_bus_tdata; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_bus_tvalid; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_bus_tready; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_bus_tuser; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_bus_tlast; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_dataIO_ready; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_dataIO_valid; // @[DMATop.scala 42:30:@1290.4]
  wire [31:0] writerFrontend_io_dataIO_bits; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_xfer_done; // @[DMATop.scala 42:30:@1290.4]
  wire [31:0] writerFrontend_io_xfer_length; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_xfer_valid; // @[DMATop.scala 42:30:@1290.4]
  wire  writerFrontend_io_xfer_first; // @[DMATop.scala 42:30:@1290.4]
  wire [31:0] csr_io_csr_0_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_0_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_0_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_1_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_2_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_2_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_2_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_3_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_3_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_3_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_4_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_4_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_4_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_5_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_5_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_5_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_6_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_6_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_6_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_7_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_7_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_7_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_8_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_8_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_8_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_9_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_9_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_9_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_10_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_10_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_10_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_11_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_11_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_11_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_12_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_13_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_14_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_14_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_14_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_15_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_csr_15_dataWrite; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_csr_15_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire [3:0] csr_io_bus_addr; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_bus_dataOut; // @[DMATop.scala 44:19:@1293.4]
  wire [31:0] csr_io_bus_dataIn; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_bus_write; // @[DMATop.scala 44:19:@1293.4]
  wire  csr_io_bus_read; // @[DMATop.scala 44:19:@1293.4]
  wire  ctl_clock; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_reset; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_0_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_0_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_0_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_1_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_2_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_2_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_2_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_3_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_3_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_3_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_4_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_4_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_4_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_5_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_5_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_5_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_6_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_6_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_6_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_7_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_7_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_7_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_8_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_8_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_8_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_9_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_9_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_9_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_10_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_10_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_10_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_11_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_11_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_11_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_12_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_13_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_14_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_14_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_14_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_15_dataOut; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_csr_15_dataWrite; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_csr_15_dataIn; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_irq_readerDone; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_irq_writerDone; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_sync_readerSync; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_sync_writerSync; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_xferRead_done; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_xferRead_address; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_xferRead_length; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_xferRead_valid; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_xferWrite_done; // @[DMATop.scala 46:19:@1296.4]
  wire [31:0] ctl_io_xferWrite_length; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_xferWrite_valid; // @[DMATop.scala 46:19:@1296.4]
  wire  ctl_io_xferWrite_first; // @[DMATop.scala 46:19:@1296.4]
  wire  queue_clock; // @[Decoupled.scala 294:21:@1299.4]
  wire  queue_reset; // @[Decoupled.scala 294:21:@1299.4]
  wire  queue_io_enq_ready; // @[Decoupled.scala 294:21:@1299.4]
  wire  queue_io_enq_valid; // @[Decoupled.scala 294:21:@1299.4]
  wire [31:0] queue_io_enq_bits; // @[Decoupled.scala 294:21:@1299.4]
  wire  queue_io_deq_ready; // @[Decoupled.scala 294:21:@1299.4]
  wire  queue_io_deq_valid; // @[Decoupled.scala 294:21:@1299.4]
  wire [31:0] queue_io_deq_bits; // @[Decoupled.scala 294:21:@1299.4]
  WishboneCSRAXI_WB_AXIS csrFrontend ( // @[DMATop.scala 38:27:@1284.4]
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
  AXI4ReaderAXI_WB_AXIS readerFrontend ( // @[DMATop.scala 40:30:@1287.4]
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
  AXIStreamMasterAXI_WB_AXIS writerFrontend ( // @[DMATop.scala 42:30:@1290.4]
    .clock(writerFrontend_clock),
    .reset(writerFrontend_reset),
    .io_bus_tdata(writerFrontend_io_bus_tdata),
    .io_bus_tvalid(writerFrontend_io_bus_tvalid),
    .io_bus_tready(writerFrontend_io_bus_tready),
    .io_bus_tuser(writerFrontend_io_bus_tuser),
    .io_bus_tlast(writerFrontend_io_bus_tlast),
    .io_dataIO_ready(writerFrontend_io_dataIO_ready),
    .io_dataIO_valid(writerFrontend_io_dataIO_valid),
    .io_dataIO_bits(writerFrontend_io_dataIO_bits),
    .io_xfer_done(writerFrontend_io_xfer_done),
    .io_xfer_length(writerFrontend_io_xfer_length),
    .io_xfer_valid(writerFrontend_io_xfer_valid),
    .io_xfer_first(writerFrontend_io_xfer_first)
  );
  CSRAXI_WB_AXIS csr ( // @[DMATop.scala 44:19:@1293.4]
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
  WorkerCSRWrapperAXI_WB_AXIS ctl ( // @[DMATop.scala 46:19:@1296.4]
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
    .io_xferWrite_length(ctl_io_xferWrite_length),
    .io_xferWrite_valid(ctl_io_xferWrite_valid),
    .io_xferWrite_first(ctl_io_xferWrite_first)
  );
  Queue queue ( // @[Decoupled.scala 294:21:@1299.4]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  assign io_control_dat_o = csrFrontend_io_ctl_dat_o; // @[DMATop.scala 52:22:@1316.4]
  assign io_control_ack_o = csrFrontend_io_ctl_ack_o; // @[DMATop.scala 52:22:@1310.4]
  assign io_control_stall_o = 1'h0; // @[DMATop.scala 52:22:@1309.4]
  assign io_control_err_o = 1'h0; // @[DMATop.scala 52:22:@1308.4]
  assign io_read_aw_awid = 4'h0; // @[DMATop.scala 58:11:@1433.4]
  assign io_read_aw_awaddr = 32'h0; // @[DMATop.scala 58:11:@1432.4]
  assign io_read_aw_awlen = 8'h0; // @[DMATop.scala 58:11:@1431.4]
  assign io_read_aw_awsize = 3'h0; // @[DMATop.scala 58:11:@1430.4]
  assign io_read_aw_awburst = 2'h0; // @[DMATop.scala 58:11:@1429.4]
  assign io_read_aw_awlock = 1'h0; // @[DMATop.scala 58:11:@1428.4]
  assign io_read_aw_awcache = 4'h0; // @[DMATop.scala 58:11:@1427.4]
  assign io_read_aw_awprot = 3'h0; // @[DMATop.scala 58:11:@1426.4]
  assign io_read_aw_awqos = 4'h0; // @[DMATop.scala 58:11:@1425.4]
  assign io_read_aw_awvalid = 1'h0; // @[DMATop.scala 58:11:@1424.4]
  assign io_read_w_wdata = 32'h0; // @[DMATop.scala 58:11:@1422.4]
  assign io_read_w_wstrb = 4'h0; // @[DMATop.scala 58:11:@1421.4]
  assign io_read_w_wlast = 1'h0; // @[DMATop.scala 58:11:@1420.4]
  assign io_read_w_wvalid = 1'h0; // @[DMATop.scala 58:11:@1419.4]
  assign io_read_b_bready = 1'h0; // @[DMATop.scala 58:11:@1414.4]
  assign io_read_ar_arid = 4'h0; // @[DMATop.scala 58:11:@1413.4]
  assign io_read_ar_araddr = readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 58:11:@1412.4]
  assign io_read_ar_arlen = readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 58:11:@1411.4]
  assign io_read_ar_arsize = 3'h2; // @[DMATop.scala 58:11:@1410.4]
  assign io_read_ar_arburst = 2'h1; // @[DMATop.scala 58:11:@1409.4]
  assign io_read_ar_arlock = 1'h0; // @[DMATop.scala 58:11:@1408.4]
  assign io_read_ar_arcache = 4'h2; // @[DMATop.scala 58:11:@1407.4]
  assign io_read_ar_arprot = 3'h0; // @[DMATop.scala 58:11:@1406.4]
  assign io_read_ar_arqos = 4'h0; // @[DMATop.scala 58:11:@1405.4]
  assign io_read_ar_arvalid = readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 58:11:@1404.4]
  assign io_read_r_rready = readerFrontend_io_bus_r_rready; // @[DMATop.scala 58:11:@1397.4]
  assign io_write_tdata = writerFrontend_io_bus_tdata; // @[DMATop.scala 59:12:@1438.4]
  assign io_write_tvalid = writerFrontend_io_bus_tvalid; // @[DMATop.scala 59:12:@1437.4]
  assign io_write_tuser = writerFrontend_io_bus_tuser; // @[DMATop.scala 59:12:@1435.4]
  assign io_write_tlast = writerFrontend_io_bus_tlast; // @[DMATop.scala 59:12:@1434.4]
  assign io_irq_readerDone = ctl_io_irq_readerDone; // @[DMATop.scala 61:10:@1440.4]
  assign io_irq_writerDone = ctl_io_irq_writerDone; // @[DMATop.scala 61:10:@1439.4]
  assign csrFrontend_clock = clock; // @[:@1285.4]
  assign csrFrontend_reset = reset; // @[:@1286.4]
  assign csrFrontend_io_ctl_dat_i = io_control_dat_i; // @[DMATop.scala 52:22:@1317.4]
  assign csrFrontend_io_ctl_cyc_i = io_control_cyc_i; // @[DMATop.scala 52:22:@1315.4]
  assign csrFrontend_io_ctl_stb_i = io_control_stb_i; // @[DMATop.scala 52:22:@1314.4]
  assign csrFrontend_io_ctl_we_i = io_control_we_i; // @[DMATop.scala 52:22:@1313.4]
  assign csrFrontend_io_ctl_adr_i = io_control_adr_i; // @[DMATop.scala 52:22:@1312.4]
  assign csrFrontend_io_bus_dataIn = csr_io_bus_dataIn; // @[DMATop.scala 53:14:@1320.4]
  assign readerFrontend_clock = clock; // @[:@1288.4]
  assign readerFrontend_reset = reset; // @[:@1289.4]
  assign readerFrontend_io_bus_ar_arready = io_read_ar_arready; // @[DMATop.scala 58:11:@1403.4]
  assign readerFrontend_io_bus_r_rdata = io_read_r_rdata; // @[DMATop.scala 58:11:@1401.4]
  assign readerFrontend_io_bus_r_rlast = io_read_r_rlast; // @[DMATop.scala 58:11:@1399.4]
  assign readerFrontend_io_bus_r_rvalid = io_read_r_rvalid; // @[DMATop.scala 58:11:@1398.4]
  assign readerFrontend_io_dataIO_ready = queue_io_enq_ready; // @[Decoupled.scala 297:17:@1304.4]
  assign readerFrontend_io_xfer_address = ctl_io_xferRead_address; // @[DMATop.scala 55:26:@1390.4]
  assign readerFrontend_io_xfer_length = ctl_io_xferRead_length; // @[DMATop.scala 55:26:@1389.4]
  assign readerFrontend_io_xfer_valid = ctl_io_xferRead_valid; // @[DMATop.scala 55:26:@1388.4]
  assign writerFrontend_clock = clock; // @[:@1291.4]
  assign writerFrontend_reset = reset; // @[:@1292.4]
  assign writerFrontend_io_bus_tready = io_write_tready; // @[DMATop.scala 59:12:@1436.4]
  assign writerFrontend_io_dataIO_valid = queue_io_deq_valid; // @[DMATop.scala 50:9:@1306.4]
  assign writerFrontend_io_dataIO_bits = queue_io_deq_bits; // @[DMATop.scala 50:9:@1305.4]
  assign writerFrontend_io_xfer_length = ctl_io_xferWrite_length; // @[DMATop.scala 56:26:@1394.4]
  assign writerFrontend_io_xfer_valid = ctl_io_xferWrite_valid; // @[DMATop.scala 56:26:@1393.4]
  assign writerFrontend_io_xfer_first = ctl_io_xferWrite_first; // @[DMATop.scala 56:26:@1392.4]
  assign csr_io_csr_0_dataIn = ctl_io_csr_0_dataIn; // @[DMATop.scala 54:14:@1323.4]
  assign csr_io_csr_1_dataIn = ctl_io_csr_1_dataIn; // @[DMATop.scala 54:14:@1327.4]
  assign csr_io_csr_2_dataIn = ctl_io_csr_2_dataIn; // @[DMATop.scala 54:14:@1331.4]
  assign csr_io_csr_3_dataIn = ctl_io_csr_3_dataIn; // @[DMATop.scala 54:14:@1335.4]
  assign csr_io_csr_4_dataIn = ctl_io_csr_4_dataIn; // @[DMATop.scala 54:14:@1339.4]
  assign csr_io_csr_5_dataIn = ctl_io_csr_5_dataIn; // @[DMATop.scala 54:14:@1343.4]
  assign csr_io_csr_6_dataIn = ctl_io_csr_6_dataIn; // @[DMATop.scala 54:14:@1347.4]
  assign csr_io_csr_7_dataIn = ctl_io_csr_7_dataIn; // @[DMATop.scala 54:14:@1351.4]
  assign csr_io_csr_8_dataIn = ctl_io_csr_8_dataIn; // @[DMATop.scala 54:14:@1355.4]
  assign csr_io_csr_9_dataIn = ctl_io_csr_9_dataIn; // @[DMATop.scala 54:14:@1359.4]
  assign csr_io_csr_10_dataIn = ctl_io_csr_10_dataIn; // @[DMATop.scala 54:14:@1363.4]
  assign csr_io_csr_11_dataIn = ctl_io_csr_11_dataIn; // @[DMATop.scala 54:14:@1367.4]
  assign csr_io_csr_12_dataIn = ctl_io_csr_12_dataIn; // @[DMATop.scala 54:14:@1371.4]
  assign csr_io_csr_13_dataIn = ctl_io_csr_13_dataIn; // @[DMATop.scala 54:14:@1375.4]
  assign csr_io_csr_14_dataIn = ctl_io_csr_14_dataIn; // @[DMATop.scala 54:14:@1379.4]
  assign csr_io_csr_15_dataIn = ctl_io_csr_15_dataIn; // @[DMATop.scala 54:14:@1383.4]
  assign csr_io_bus_addr = csrFrontend_io_bus_addr; // @[DMATop.scala 53:14:@1322.4]
  assign csr_io_bus_dataOut = csrFrontend_io_bus_dataOut; // @[DMATop.scala 53:14:@1321.4]
  assign csr_io_bus_write = csrFrontend_io_bus_write; // @[DMATop.scala 53:14:@1319.4]
  assign csr_io_bus_read = csrFrontend_io_bus_read; // @[DMATop.scala 53:14:@1318.4]
  assign ctl_clock = clock; // @[:@1297.4]
  assign ctl_reset = reset; // @[:@1298.4]
  assign ctl_io_csr_0_dataOut = csr_io_csr_0_dataOut; // @[DMATop.scala 54:14:@1325.4]
  assign ctl_io_csr_0_dataWrite = csr_io_csr_0_dataWrite; // @[DMATop.scala 54:14:@1324.4]
  assign ctl_io_csr_2_dataOut = csr_io_csr_2_dataOut; // @[DMATop.scala 54:14:@1333.4]
  assign ctl_io_csr_2_dataWrite = csr_io_csr_2_dataWrite; // @[DMATop.scala 54:14:@1332.4]
  assign ctl_io_csr_3_dataOut = csr_io_csr_3_dataOut; // @[DMATop.scala 54:14:@1337.4]
  assign ctl_io_csr_3_dataWrite = csr_io_csr_3_dataWrite; // @[DMATop.scala 54:14:@1336.4]
  assign ctl_io_csr_4_dataOut = csr_io_csr_4_dataOut; // @[DMATop.scala 54:14:@1341.4]
  assign ctl_io_csr_4_dataWrite = csr_io_csr_4_dataWrite; // @[DMATop.scala 54:14:@1340.4]
  assign ctl_io_csr_5_dataOut = csr_io_csr_5_dataOut; // @[DMATop.scala 54:14:@1345.4]
  assign ctl_io_csr_5_dataWrite = csr_io_csr_5_dataWrite; // @[DMATop.scala 54:14:@1344.4]
  assign ctl_io_csr_6_dataOut = csr_io_csr_6_dataOut; // @[DMATop.scala 54:14:@1349.4]
  assign ctl_io_csr_6_dataWrite = csr_io_csr_6_dataWrite; // @[DMATop.scala 54:14:@1348.4]
  assign ctl_io_csr_7_dataOut = csr_io_csr_7_dataOut; // @[DMATop.scala 54:14:@1353.4]
  assign ctl_io_csr_7_dataWrite = csr_io_csr_7_dataWrite; // @[DMATop.scala 54:14:@1352.4]
  assign ctl_io_csr_8_dataOut = csr_io_csr_8_dataOut; // @[DMATop.scala 54:14:@1357.4]
  assign ctl_io_csr_8_dataWrite = csr_io_csr_8_dataWrite; // @[DMATop.scala 54:14:@1356.4]
  assign ctl_io_csr_9_dataOut = csr_io_csr_9_dataOut; // @[DMATop.scala 54:14:@1361.4]
  assign ctl_io_csr_9_dataWrite = csr_io_csr_9_dataWrite; // @[DMATop.scala 54:14:@1360.4]
  assign ctl_io_csr_10_dataOut = csr_io_csr_10_dataOut; // @[DMATop.scala 54:14:@1365.4]
  assign ctl_io_csr_10_dataWrite = csr_io_csr_10_dataWrite; // @[DMATop.scala 54:14:@1364.4]
  assign ctl_io_csr_11_dataOut = csr_io_csr_11_dataOut; // @[DMATop.scala 54:14:@1369.4]
  assign ctl_io_csr_11_dataWrite = csr_io_csr_11_dataWrite; // @[DMATop.scala 54:14:@1368.4]
  assign ctl_io_csr_14_dataOut = csr_io_csr_14_dataOut; // @[DMATop.scala 54:14:@1381.4]
  assign ctl_io_csr_14_dataWrite = csr_io_csr_14_dataWrite; // @[DMATop.scala 54:14:@1380.4]
  assign ctl_io_csr_15_dataOut = csr_io_csr_15_dataOut; // @[DMATop.scala 54:14:@1385.4]
  assign ctl_io_csr_15_dataWrite = csr_io_csr_15_dataWrite; // @[DMATop.scala 54:14:@1384.4]
  assign ctl_io_sync_readerSync = io_sync_readerSync; // @[DMATop.scala 62:11:@1442.4]
  assign ctl_io_sync_writerSync = io_sync_writerSync; // @[DMATop.scala 62:11:@1441.4]
  assign ctl_io_xferRead_done = readerFrontend_io_xfer_done; // @[DMATop.scala 55:26:@1391.4]
  assign ctl_io_xferWrite_done = writerFrontend_io_xfer_done; // @[DMATop.scala 56:26:@1396.4]
  assign queue_clock = clock; // @[:@1300.4]
  assign queue_reset = reset; // @[:@1301.4]
  assign queue_io_enq_valid = readerFrontend_io_dataIO_valid; // @[Decoupled.scala 295:22:@1302.4]
  assign queue_io_enq_bits = readerFrontend_io_dataIO_bits; // @[Decoupled.scala 296:21:@1303.4]
  assign queue_io_deq_ready = writerFrontend_io_dataIO_ready; // @[DMATop.scala 50:9:@1307.4]
endmodule
