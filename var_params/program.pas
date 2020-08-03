program powers;

procedure Powers(pseed: real; var ptwo, pthree, pfour, pfive: real);
begin
	ptwo := pseed * pseed;
	pthree := ptwo * pseed;
	pfour := pthree * pseed;
	pfive := pfour * pseed
end;

var 
	a, b, c, d: real;
begin
	Powers(4, a, b, c, d);
	writeln(a, ' ', b, ' ', c, ' ', d)
end.
