program hello;
const
	message = 'Spi';
	filename = 'hello.txt';
var
	f: text;
begin
	{$I-}
	assign(f, filename);
	rewrite(f);
	if IOResult <> 0 then begin
		writeln('Coundnt open file' , filename);
		halt(1);
	end;
	writeln(f, message);
	if IOResult <> 0 then begin
		writeln('Couldnt write to the file');
		halt(1);
	end;
	close(f)
end.
