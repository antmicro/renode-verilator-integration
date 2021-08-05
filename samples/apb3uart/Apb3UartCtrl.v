// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : Apb3UartCtrl
// Git hash  : 5502e4f7f60ee9ef0a1edd7bca2b2dd6cbcea819


`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100


module Apb3UartCtrl (
  input      [4:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_interrupt,
  input               clk,
  input               reset
);
  reg                 uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [5:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [5:0]    uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [5:0]    _zz_io_apb_PRDATA;
  wire       [19:0]   _zz_bridge_uartConfigReg_clockDivider;
  wire       [19:0]   _zz_bridge_uartConfigReg_clockDivider_1;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        `UartStopType_defaultEncoding_type bridge_uartConfigReg_frame_stop;
  reg        `UartParityType_defaultEncoding_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 when_BusSlaveFactory_l332;
  wire                when_BusSlaveFactory_l334;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l332_1;
  wire                when_BusSlaveFactory_l334_1;
  wire                when_UartCtrl_l152;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l154;
  reg                 when_BusSlaveFactory_l332_2;
  wire                when_BusSlaveFactory_l334_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l363;
  wire                when_BusSlaveFactory_l365;
  reg                 when_BusSlaveFactory_l332_3;
  wire                when_BusSlaveFactory_l334_3;
  wire       `UartParityType_defaultEncoding_type _zz_bridge_uartConfigReg_frame_parity;
  wire       `UartStopType_defaultEncoding_type _zz_bridge_uartConfigReg_frame_stop;
  wire                when_Apb3SlaveFactory_l82;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_bridge_uartConfigReg_frame_parity_string;
  reg [23:0] _zz_bridge_uartConfigReg_frame_stop_string;
  `endif


  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (6'h20 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  assign _zz_bridge_uartConfigReg_clockDivider_1 = io_apb_PWDATA[19 : 0];
  assign _zz_bridge_uartConfigReg_clockDivider = _zz_bridge_uartConfigReg_clockDivider_1;
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                  ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider                                ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid    ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready                                        ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload  ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid                                         ), //o
    .io_read_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready              ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload                                       ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd                                           ), //o
    .io_uart_rxd                   (io_uart_rxd                                                      ), //i
    .io_readError                  (uartCtrl_1_io_readError                                          ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                              ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak                                          ), //o
    .clk                           (clk                                                              ), //i
    .reset                         (reset                                                            )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid      (bridge_write_streamUnbuffered_valid                               ), //i
    .io_push_ready      (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready    ), //o
    .io_push_payload    (bridge_write_streamUnbuffered_payload                             ), //i
    .io_pop_valid       (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid     ), //o
    .io_pop_ready       (uartCtrl_1_io_write_ready                                         ), //i
    .io_pop_payload     (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload   ), //o
    .io_flush           (1'b0                                                              ), //i
    .io_occupancy       (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy     ), //o
    .io_availability    (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability  ), //o
    .clk                (clk                                                               ), //i
    .reset              (reset                                                             )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid      (uartCtrl_1_io_read_valid                               ), //i
    .io_push_ready      (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready    ), //o
    .io_push_payload    (uartCtrl_1_io_read_payload                             ), //i
    .io_pop_valid       (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid     ), //o
    .io_pop_ready       (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready     ), //i
    .io_pop_payload     (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload   ), //o
    .io_flush           (1'b0                                                   ), //i
    .io_occupancy       (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy     ), //o
    .io_availability    (uartCtrl_1_io_read_queueWithOccupancy_io_availability  ), //o
    .clk                (clk                                                    ), //i
    .reset              (reset                                                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : _zz_bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : _zz_bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : _zz_bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : _zz_bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : _zz_bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : _zz_bridge_uartConfigReg_frame_stop_string = "TWO";
      default : _zz_bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'h0 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'h04 : begin
        io_apb_PRDATA[21 : 16] = _zz_io_apb_PRDATA;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[29 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'h10 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1_io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l332 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l332 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l334 = io_apb_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l332_1 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l332_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l334_1 = io_apb_PWDATA[1];
  assign when_UartCtrl_l152 = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l154 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l332_2 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l332_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l334_2 = io_apb_PWDATA[9];
  always @(*) begin
    when_BusSlaveFactory_l363 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l363 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l365 = io_apb_PWDATA[10];
  always @(*) begin
    when_BusSlaveFactory_l332_3 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l332_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l334_3 = io_apb_PWDATA[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_bridge_uartConfigReg_frame_parity = io_apb_PWDATA[9 : 8];
  assign _zz_bridge_uartConfigReg_frame_stop = io_apb_PWDATA[16 : 16];
  assign when_Apb3SlaveFactory_l82 = ((io_apb_PADDR & (~ 5'h03)) == 5'h08);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(when_BusSlaveFactory_l332) begin
        if(when_BusSlaveFactory_l334) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l332_1) begin
        if(when_BusSlaveFactory_l334_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(when_UartCtrl_l152) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l154) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l332_2) begin
        if(when_BusSlaveFactory_l334_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l363) begin
        if(when_BusSlaveFactory_l365) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l332_3) begin
        if(when_BusSlaveFactory_l334_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_apb_PADDR)
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
      if(when_Apb3SlaveFactory_l82) begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_bridge_uartConfigReg_clockDivider;
        end
      end
    end
  end

  always @(posedge clk) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
    case(io_apb_PADDR)
      5'h0c : begin
        if(busCtrl_doWrite) begin
          bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
          bridge_uartConfigReg_frame_parity <= _zz_bridge_uartConfigReg_frame_parity;
          bridge_uartConfigReg_frame_stop <= _zz_bridge_uartConfigReg_frame_stop;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk,
  input               reset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l955;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l955 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l955) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk,
  input               reset
);
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_write_valid               (io_write_thrown_valid       ), //i
    .io_write_ready               (tx_io_write_ready           ), //o
    .io_write_payload             (io_write_thrown_payload     ), //i
    .io_cts                       (1'b0                        ), //i
    .io_txd                       (tx_io_txd                   ), //o
    .io_break                     (io_writeBreak               ), //i
    .clk                          (clk                         ), //i
    .reset                        (reset                       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength    (io_config_frame_dataLength  ), //i
    .io_configFrame_stop          (io_config_frame_stop        ), //i
    .io_configFrame_parity        (io_config_frame_parity      ), //i
    .io_samplingTick              (clockDivider_tick           ), //i
    .io_read_valid                (rx_io_read_valid            ), //o
    .io_read_ready                (io_read_ready               ), //i
    .io_read_payload              (rx_io_read_payload          ), //o
    .io_rxd                       (io_uart_rxd                 ), //i
    .io_rts                       (rx_io_rts                   ), //o
    .io_error                     (rx_io_error                 ), //o
    .io_break                     (rx_io_break                 ), //o
    .clk                          (clk                         ), //i
    .reset                        (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk,
  input               reset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_sampler_value;
  wire                _zz_sampler_value_1;
  wire                _zz_sampler_value_2;
  wire                _zz_sampler_value_3;
  wire                _zz_sampler_value_4;
  wire                _zz_sampler_value_5;
  wire                _zz_sampler_value_6;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  assign _zz_sampler_value = ((((1'b0 || ((_zz_sampler_value_1 && sampler_samples_1) && sampler_samples_2)) || (((_zz_sampler_value_2 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_sampler_value_3 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_sampler_value_4 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_sampler_value_5 = (1'b1 && sampler_samples_1);
  assign _zz_sampler_value_6 = 1'b1;
  assign _zz_sampler_value_1 = (1'b1 && sampler_samples_0);
  assign _zz_sampler_value_2 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_dataIn     (io_rxd                      ), //i
    .io_dataOut    (io_rxd_buffercc_io_dataOut  ), //o
    .clk           (clk                         ), //i
    .reset         (reset                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h68);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == `UartParityType_defaultEncoding_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick) begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick) begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_sampler_value || _zz_sampler_value_3) || (_zz_sampler_value_4 && sampler_samples_4)) || ((_zz_sampler_value_5 && sampler_samples_2) && sampler_samples_4)) || (((_zz_sampler_value_6 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b010;
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk,
  input               reset
);
  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b111);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == `UartParityType_defaultEncoding_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge clk) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
