{$MODE OBJFPC}
{$R-,Q-,S-,I+}
{$OPTIMIZATION LEVEL2}
program IntervalCover;
uses Windows, SysUtils, Math;
const
  prefix = 'CAU3';
  InputFile  = prefix + '.INP';
  OutputFile = prefix + '.OUT';
  AnswerFile = prefix + '.ANS';
  MAXN = 100000 + 100;
var
  dirT, dirC: WideString;
  fi, fo, fa: TextFile;
  a, b : array[0..MAXN] of longint;
  ans , u , sum : int64;
  i, n, x, m, w, j : longint;
  avail : array[0..MAXN] of boolean;
procedure GenErr(const s: string; const param: array of const);
begin
  raise Exception.CreateFmt(s, param);
end;

procedure ReadDirs;
var
  s: AnsiString;
begin
  ReadLn(s); dirT := Utf8Decode(s);
  ReadLn(s); dirC := Utf8Decode(s);
end;

procedure OpenFiles;
var
  CurrentDir: array[0..Max_Path + 1] of WideChar;
begin
  GetCurrentDirectoryW(Max_Path, CurrentDir);
  SetCurrentDirectoryW(PWideChar(dirT));
  AssignFile(fi, InputFile); Reset(fi);
  AssignFile(fa, AnswerFile); Reset(fa);
  SetCurrentDirectoryW(CurrentDir);
  SetCurrentDirectoryW(PWideChar(dirC));
  AssignFile(fo, OutputFile); Reset(fo);
end;

procedure CloseFiles;
begin
  CloseFile(fi);
  CloseFile(fa);
  CloseFile(fo);
end;

procedure DoCheck;
begin
    readln(fi,n);
    for i := 1 to n do read(fi,a[i]);
    readln(fa,ans);
    readln(fo,u);
    if (ans <> u) then
    begin
        writeln('Sai số tiền thưởng');
        write('0.0');
        exit;
    end;
    sum := 0;
    m   := 0;
    while not seekeof(fo) do
    begin
        read(fo,x);
        inc(m);
        b[m] := x;
        if ((x < 1) or (x > n)) then
        begin
            writeln('Chỉ số của khúc gỗ bé hơn 1 hoặc lớn hơn n');
            write('0.5');
            exit;
        end;
        sum := sum + a[x];
    end;
    if (m = 0) then
    begin
        writeln('Không thực hiên truy vết');
        write('0.5');
        exit;
    end;
    for i := 1 to n do avail[i] := false;
    w     := 1;
    for i := 1 to m do
    begin
        if (avail[b[i]] = true) then
        begin
            writeln('Bạn chọn trùng món quà');
            write('0.5');
            exit;
        end;
        if (b[i] + 1 = b[i + 1]) then
        begin
            inc(w);
            avail[b[i]] := true;
            if (w > 3) then
            begin
                writeln('Bạn chọn quá 3 khúc gỗ liên tiếp');
                write('0.5');
                exit;
            end;
        end
        else
        begin
            avail[b[i]] := true;
            for j := b[i] + 1 to b[i] + w do
                avail[j] := true;
            w := 1;
        end;
    end;
    if (sum <> ans) then
    begin
        writeln('Đáp án của truy vết sai');
        write('0.5');
        exit;
    end;
    writeln('Good Job');
    write('1.0');
  {while not seekeof(fo) do
  begin
        read(fo, chiso);
        sW:= sW + w[chiso];
        sV:= sV + v[chiso];
  end;}
end;

begin
  Write(#$EF#$BB#$BF); //Utf-8 BOM
  try
    try
      ReadDirs;
      OpenFiles;
      DoCheck;
    finally
      CloseFiles;
    end;
  except
    on E: Exception do
      begin
        WriteLn(E.Message);
        WriteLn('0.0');
      end;
  end;
end.