DESTDIR=
FORTUNES=/usr/share/games/fortunes
GAMES=/usr/games

DATA=tang300.dat song100.dat shijing.dat mingyan.dat
DATAFILES=tang300 song100 shijing mingyan
all: $(DATA)

stat:
	bash util/statistic.sh

tang300.dat:tang300
	strfile $< tang300.dat
song100.dat:song100
	strfile $< song100.dat
shijing.dat:shijing
	strfile $< shijing.dat
mingyan.dat:mingyan
	strfile $< mingyan.dat

distclean:
	rm -f *dat
clean:
	rm -f *dat

install: all
	mkdir -p $(DESTDIR)$(FORTUNES)
	mkdir -p $(DESTDIR)$(GAMES)
	install -m0755  fortune-zh $(DESTDIR)$(GAMES)
	install -m0755  fortune-zh.old $(DESTDIR)$(GAMES)
	
	install -m0644  tang300 $(DESTDIR)$(FORTUNES)
	cp -d  tang300.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  tang300.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644  song100 $(DESTDIR)$(FORTUNES)
	cp -d  song100.u8 $(DESTDIR)$(FORTUNES)
	install -m0644  song100.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644 shijing $(DESTDIR)$(FORTUNES)
	cp -d shijing.u8 $(DESTDIR)$(FORTUNES)
	install -m0644 shijing.dat $(DESTDIR)$(FORTUNES)
	
	install -m0644 mingyan $(DESTDIR)$(FORTUNES)
	cp -d mingyan.u8 $(DESTDIR)$(FORTUNES)
	install -m0644 mingyan.dat $(DESTDIR)$(FORTUNES)

