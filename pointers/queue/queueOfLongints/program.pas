program DuplicateLongInts;
type 
	LongItemPtr = ^LongItem;
	LongItem = record
		next: LongItemPtr;
		data: longint;
	end;
	QueueOfLongints = record
		first, last: LongItemPtr;
	end;

procedure QOLInit(var queue: QueueOfLongints);
begin
	queue.first := nil;
	queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongints; n: longint);
begin
	if queue.first = nil then begin
		new(queue.first);
		queue.last := queue.first
	end
	else begin
		new(queue.last^.next);
		queue.last := queue.last^.next
	end;
	queue.last^.data := n;
	queue.last^.next := nil
end;

function QOLGet(var queue: QueueOfLongints; var n: longint) : boolean;
var 
	cur: LongItemPtr;
begin
	if queue.first = nil then begin
		QOLGet := false;
		exit
	end;
	n := queue.first^.data;
	cur := queue.first;
	queue.first := queue.first^.next;
	if queue.first = nil then 
		queue.last := nil;
	dispose(cur);
	QOLGet := true
end;

function QOLIsEmpty(var queue: QueueOfLongints) : boolean;
begin
	QOLIsEmpty := queue.first = nil
end;

var
	queue: QueueOfLongints;
	n: longint;
begin
	QOLInit(queue);
	while not SeekEof do begin
		read(n);
		QOLPut(queue, n);
	end;
	
	while QOLGet(queue, n) do begin
		writeln(n);
		writeln(n)
	end;
end.


