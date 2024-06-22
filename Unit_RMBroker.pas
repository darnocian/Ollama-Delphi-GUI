unit Unit_RMBroker;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  System.JSON,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Unit_Common,
  Vcl.Buttons,
  System.Skia,
  Vcl.Skia;

type
  TForm_RMBroker = class(TForm)
    RESTClient_RM: TRESTClient;
    RESTRequest_RM: TRESTRequest;
    RESTResponse_RM: TRESTResponse;
    Panel1: TPanel;
    Memo_Log_Rm: TMemo;
    StatusBar_RM: TStatusBar;
    Label1: TLabel;
    Label_Connection: TLabel;
    CheckBox_Logoption: TCheckBox;
    SpeedButton_GetUsers: TSpeedButton;
    SkSvg_RMBroker: TSkSvg;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RM_DMMESSAGE(var Msg: TMessage); Message WF_DM_MESSAGE;
    procedure SpeedButton_GetUsersClick(Sender: TObject);
    //
    procedure OnRESTRequest_RMError(Sender: TObject);
    procedure RESTClient_RMReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);
    procedure RESTClient_RMSendData(const Sender: TObject; AContentLength, AWriteCount: Int64; var AAbort: Boolean);
  private
    FAborting_Flag: Boolean;
    FRequesting_Flag: Boolean;
    FRemoteCntFlag: Integer;
    FResponseSize: Int64;
    FProcessCntFlag: Integer;
    //
    FUser_Rm: string;
    FQueue_Rm: string;
    FMmodel_Rm: string;
    FPrompt_Rm: string;
    procedure OnRESTRequest_RMAfterRequest;
    procedure Common_RestSettings_Rm(const Aflag: Integer);
    procedure Do_Abort(const AFlag: Integer=0);
    procedure Rm_StartRequest();
    procedure Add_LogWin (const ALog: string) ;
    procedure Push_LogWin(const AFlag: Integer = 0; const ALog: string = '');
    procedure SetProcessCntFlag(const Value: Integer);
    procedure Reset_RESTComponentsToDefaults;
  public
    property User_Rm: string            read FUser_Rm           write FUser_Rm;
    property Queue_Rm: string           read FQueue_Rm          write FQueue_Rm;
    property Mmodel_Rm: string          read FMmodel_Rm         write FMmodel_Rm;
    property Prompt_Rm: string          read FPrompt_Rm         write FPrompt_Rm;
    property Requesting_Flag: Boolean   read FRequesting_Flag   write FRequesting_Flag;
    property ProcessCntFlag: Integer    read FProcessCntFlag    write SetProcessCntFlag;
  end;

var
  Form_RMBroker: TForm_RMBroker;

implementation

uses
  System.JSON.Types,
  System.Threading,
  System.Diagnostics,
  System.UITypes,
  Unit_Main,
  Unit_DMServer;

{$R *.dfm}

var
  V_RmStopWatch: TStopWatch;
  V_RmElapsedInterval: Int64;
  V_RmBaseURL: string = GC_BaseURL_Chat;
  V_RmBaseURLarray: array[TRequest_Type] of string = (GC_BaseURL_Generate, GC_BaseURL_Chat);
  V_RmDummyFlag: Integer = 0;
  V_RmBuffLogLines: string;
  V_RmRepeatFlag: Boolean = False;

{  TForm_RMBroker ...}

procedure TForm_RMBroker.FormCreate(Sender: TObject);
begin
  if DM_ACTIVATECODE = 0 then Exit;

  FUser_Rm :=   'user';
  FQueue_Rm :=  '999';
  FMmodel_Rm := 'phi3';
  FPrompt_Rm:=  'Who are you ?';
  Memo_Log_Rm.Lines.Clear;
  SkSvg_RMBroker.Svg.Source := C_RemoteConn_Svg1;
end;

procedure TForm_RMBroker.FormDestroy(Sender: TObject);
begin
  if DM_ACTIVATECODE = 0 then Exit;

  FRequesting_Flag := True;
  Do_Abort(0);

  var _slog: string := Format('%s%s%s', ['Log_rm_',FormatDateTime('yyyymmdd_hhnnss', Now()), '.txt']);
  Memo_Log_Rm.Lines.SaveToFile(CV_LogPath+_slog);
end;

procedure TForm_RMBroker.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    ModalResult := mrCancel;
  end;
end;

procedure TForm_RMBroker.Add_LogWin(const ALog: string);
begin
  V_RmBuffLogLines := V_RmBuffLogLines + FormatDateTime('hh:nn:ss', Time) + '  ';
  V_RmBuffLogLines := V_RmBuffLogLines + ALog + GC_CRLF;
end;

procedure TForm_RMBroker.Push_LogWin(const AFlag: Integer; const ALog: string);
begin
  if AFlag > 0 then
  begin
    if AFlag = 2 then
      V_RmBuffLogLines := V_RmBuffLogLines + GC_CRLF;
    if ALog <> '' then
      V_RmBuffLogLines := V_RmBuffLogLines + FormatDateTime('hh:nn:ss', Time) + '  ';
    V_RmBuffLogLines := V_RmBuffLogLines + ALog + GC_CRLF;
  end;

  var _displen := Length(V_RmBuffLogLines);
  if _displen > 0 then
  try
    SetLength(V_RmBuffLogLines, _displen - 2); // remove CRLF
    Memo_Log_Rm.Lines.Add(V_RmBuffLogLines);
    PostMessage(Memo_Log_Rm.Handle, EM_LINESCROLL, 0, 999999);
    V_RmBuffLogLines := '';
  except
  end;
end;

procedure TForm_RMBroker.RM_DMMESSAGE(var Msg: TMessage);
begin
  case Msg.WParam of
    WF_DM_MESSAGE_ADDRESS:;
    WF_DM_MESSAGE_SERVERON:;
    WF_DM_MESSAGE_SERVEROFF:;
    WF_DM_MESSAGE_CONNECT:;
    WF_DM_MESSAGE_DISCONNECT:;
    WF_DM_MESSAGE_LOGON:;
    WF_DM_MESSAGE_REQUEST:
      begin
        Rm_StartRequest();
      end;
    WF_DM_MESSAGE_REQUESTEX:;
    WF_DM_MESSAGE_RESPONSE:
      begin
        Push_LogWin(1, 'Response OK.');
        Push_LogWin(1);
      end;
    WF_DM_MESSAGE_IMAGE:;
    WF_DM_MESSAGE_WARNING:
      begin
        Push_LogWin(1, 'Not Find Line ...');
      end;
  end;

  Msg.Result := 0;
end;

procedure TForm_RMBroker.SetProcessCntFlag(const Value: Integer);
begin
  FProcessCntFlag := Value;
  var _cntflag: Boolean := ((Value mod 2) = 1);
  if Self.Visible then
    SkSvg_RMBroker.Svg.Source := IIF.CastBool<string>(_cntflag, C_RemoteConn_Svg1, C_RemoteConn_Svg0);
end;

procedure TForm_RMBroker.SpeedButton_GetUsersClick(Sender: TObject);
begin
  var _logins: string := DM_Server.Get_Logins();
  var _pos: TPoint := SpeedButton_GetUsers.ClientToScreen(Point(0, 25));
  ShowMessagePos(_logins, _pos.X, _pos.Y);
end;

{ Remote Control ... }

procedure TForm_RMBroker.Reset_RESTComponentsToDefaults;
begin
  RESTRequest_RM.ResetToDefaults;
  RESTClient_RM.ResetToDefaults;
  RESTResponse_RM.ResetToDefaults;
end;

procedure TForm_RMBroker.Common_RestSettings_Rm(const Aflag: Integer);
begin
  FRemoteCntFlag := 0;
  V_RmElapsedInterval := 0;
  RESTResponse_RM.ResetToDefaults;
  RESTClient_RM.BaseURL := V_RmBaseURL;
  RESTClient_RM.ContentType := CONTENTTYPE_APPLICATION_JSON;
  RESTClient_RM.SynchronizedEvents := True;
  with RESTRequest_RM do
  begin
    SynchronizedEvents := True;
    Method := rmPOST;
    Params.Clear;
    TransientParams.Clear;
    ClearBody;
  end;
end;

procedure TForm_RMBroker.Do_Abort(const AFlag: Integer);
begin
  FAborting_Flag := True;

  RESTRequest_RM.Cancel;
  Application.ProcessMessages;

  Common_RestSettings_Rm(0);
  V_RmStopwatch.Stop;
  Requesting_Flag := False;
  FAborting_Flag := False;
end;

procedure TForm_RMBroker.Rm_StartRequest();
begin
  if FRequesting_Flag then
  begin
    DM_Server.Response_ToClient(FUser_Rm, FQueue_Rm, FMmodel_Rm, 'Busy Now ...');
    Exit;
  end;

  var _requestjson: string := DM_Server.Get_Queue;
  if _requestjson = '' then
  begin
    Exit;
  end;

  var _JsonObj: TJSONObject := TJSONObject.ParseJSONValue(_requestjson) as TJSONObject;
  try
    if Assigned(_JsonObj) then
    begin
      FUser_Rm :=   _JsonObj.Get('user').JsonValue.Value;
      FQueue_Rm :=  _JsonObj.Get('queue').JsonValue.Value;
      FMmodel_Rm := _JsonObj.Get('model').JsonValue.Value;
      FPrompt_Rm:=  _JsonObj.Get('prompt').JsonValue.Value;
    end;
  finally
    _JsonObj.Free;
  end;

  Push_LogWin(1, 'New Remote Request Arrived : '+FQueue_Rm);
  var _queue: Integer := StrToIntDef(FQueue_Rm, 1);
  Label_Connection.Caption := Format('U-%s Qn-%.3d M-%s', [ FUser_Rm, _queue, FMmodel_Rm]);
  if (FMmodel_Rm = '') then
    FMmodel_Rm := Form_RestOllama.Model_Selected;
  if (FPrompt_Rm = '') or (FMmodel_Rm = '') then
  begin
    DM_Server.Response_ToClient(FUser_Rm, FQueue_Rm, FMmodel_Rm, 'Empty Request');
    Exit;
  end;
  // ------------------------------------------------------------------------ //
  FPrompt_Rm := Get_ReplaceSpecialChar4Json(FPrompt_Rm);
  // ------------------------------------------------------------------------ //
  Form_RestOllama.RemoteProcessingFlag := True;
  // ------------------------------------------------------------------------ //
  var _RawParams: string := '';
  if Is_LlavaModel(FMmodel_Rm) then
    begin
      DM_Server.Response_ToClient(FUser_Rm, FQueue_Rm, FMmodel_Rm, 'Not supported yet');
      Exit;
    end
  else
    begin
      case Form_RestOllama.RadioGroup_PromptType.ItemIndex of
        0: begin
             _RawParams := StringReplace( GC_GeneratePrompt, '%model%',    FMmodel_Rm,   [rfIgnoreCase]);
             _RawParams := StringReplace( _RawParams,        '%prompts%',  FPrompt_Rm,   [rfIgnoreCase]);
           end;
        1: begin
             _RawParams := StringReplace( GC_ChatContent,    '%model%',    FMmodel_Rm,   [rfIgnoreCase]);
             _RawParams := StringReplace( _RawParams,        '%content%',  FPrompt_Rm,   [rfIgnoreCase]);
           end;
      end;
    end;
  StatusBar_RM.SimpleText := '* Requesting';
  FRequesting_Flag := True;
  V_RmBaseURL := V_RmBaseURLarray[Form_RestOllama.Request_Type];

  Add_LogWin('Starting REST request for URL: ' + V_RmBaseURL);
  if CheckBox_Logoption.Checked then
    Add_LogWin('With prompt/message : "' + FPrompt_Rm+'"');
  Push_LogWin();

  V_RmStopWatch := TStopwatch.StartNew;
  Common_RestSettings_Rm(V_RmDummyFlag);
  // ------------------------------------------------------------------------------------------ //
  with RESTRequest_RM do
  begin
    Params.AddBody(_RawParams, CONTENTTYPE_APPLICATION_JSON);
    ExecuteAsync(
      OnRESTRequest_RMAfterRequest,
      True, True,
      OnRESTRequest_RMError);
  end;
  // ------------------------------------------------------------------------------------------ //
  Push_LogWin(1, 'Async REST request started');
end;

procedure TForm_RMBroker.RESTClient_RMReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);
begin
  FResponseSize := AReadCount;
  Inc(FRemoteCntFlag);
  var _elapsed: Int64 := V_RmStopWatch.ElapsedMilliseconds;
  if (_elapsed - V_RmElapsedInterval) > 500 then    // 0.5 sec ...
  begin
    V_RmElapsedInterval := _elapsed;
    TThread.Queue(nil,
      procedure
      begin
        StatusBar_RM.SimpleText := Format('* Response Read Count : %s', [BytesToKMG(AReadCount)]);
        ProcessCntFlag := FRemoteCntFlag;
        Form_RestOllama.RemoteProcessCntFlag := FRemoteCntFlag;
      end);
  end;
end;

procedure TForm_RMBroker.RESTClient_RMSendData(const Sender: TObject; AContentLength, AWriteCount: Int64; var AAbort: Boolean);
begin
  TThread.Queue(nil,
    procedure
    begin
      if AWriteCount mod 5 = 0 then
        StatusBar_RM.SimpleText := StatusBar_RM.SimpleText + '.';
    end)
end;

procedure TForm_RMBroker.OnRESTRequest_RMAfterRequest;    { synchronized by default ... }
begin
  if FAborting_Flag then
  begin
    FAborting_Flag := False;
    Exit;
  end;

  V_RmRepeatFlag := False;

  V_RmStopWatch.Stop;
  var _elapsed: Int64 := V_RmStopWatch.ElapsedMilliseconds;
  var _elapstr: string := MSecsToSeconds(_elapsed);
  var _updown: string := Format('Response Size : %s', [BytesToKMG(FResponseSize)]);
  Add_LogWin(_updown);
  Add_LogWin('Elapsed Time after request : '+_elapstr);
  StatusBar_RM.SimpleText := '* '+_updown;

  { Core routine ------------------------------------------------------------- }
    var _Responses := Unit_Common.Get_DisplayJson(Form_RestOllama.RadioGroup_PromptType.ItemIndex, False,
                                                  string(RESTResponse_RM.Content));
    _Responses := Get_ReplaceSpecialChar4Json(_Responses);
    // ---------------------------------------------------------------------- //
    DM_Server.Response_ToClient(FUser_Rm, FQueue_Rm, FMmodel_Rm, _Responses);
    // ---------------------------------------------------------------------- //
    SimpleSound_Common(Form_RestOllama.DoneSoundFlag, 1);
    Inc(V_RmDummyFlag);

    GV_CheckingAliveStart := False;
    FRequesting_Flag := False;
    Push_LogWin();
  { -------------------------------------------------------------------------- }
  ProcessCntFlag := 1;
  Form_RestOllama.RemoteProcessingFlag := False;

  if DM_Server.Get_Queue_Count > 0 then
    Rm_StartRequest();
end;

procedure TForm_RMBroker.OnRESTRequest_RMError(Sender: TObject);
begin
  Do_Abort(1);
  Push_LogWin(1,  RESTResponse_RM.StatusText);
end;

end.