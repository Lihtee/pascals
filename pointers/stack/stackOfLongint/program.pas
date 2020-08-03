program PrintReversedLongInts;
type
	LongItemPtr = ^LongItem;
	LongItem = record
		data: longint;
		next: LongItemPtr;
	end;
	StackOfLongints = LongItemPtr;

procedure SOLInit(var stack : StackOfLongints);
begin
	stack := nil
end;

procedure SOLPush(var stack: StackOfLongints; n: longint);
var
	cur: LongItemPtr;
begin
	new(cur);
	cur^.data := n;
	cur^.next := stack;
	stack := cur;
end;

function SOLPop(var stack: StackOfLongints; var n: longint) : boolean;
var
	cur: LongItemPtr;
begin
	if stack = nil then begin
		SOLPop := false;
		exit
	end;
	n := stack^.data;
	cur := stack;
	stack := stack^.next;
	dispose(cur);
	SOLPop := true
end;

function SOLIsEmpty(var stack: StackOfLongints) : boolean;
begin
	SOLIsEmpty := stack = nil
end;

var 
	s: StackOfLongints;
	n: longint;
begin
	SOLInit(s);
	while not eof do begin
		readln(n);
		SOLPush(s, n)
	end;
	while SOLPop(s, n) do 
		writeln(n)

end.
