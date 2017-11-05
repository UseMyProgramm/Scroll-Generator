USES Windows;
TYPE info = record                                              //Вода - 1 Огонь - 2 Ветер - 3
            name:String;
            star:Integer;
     end;
VAR hero                                                      :array[0..276] of info;
    GerCom,ZvezCom,GerMys,ZvezMys,GerLeg,ZvezLeg,GerLD,ZvezLD :text;
    i,scroll,rand,zvezda                                      :integer;
    imya                                                      :string;
    elem                                                      :integer;
    otvet                                                     :String;
    RandNum                                                   :integer;
    one,tw,th,fo,fi,awak                                      :integer;
PROCEDURE textcolor (x:integer);
    begin
        SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), x);
    end;
PROCEDURE elemcolor1;
    begin
        elem:=Random(3);
        case elem of
        0: textcolor(11) ;
        1: textcolor(12);
        2: textcolor(14);
        end;
    end;
PROCEDURE elemcolor2;
    begin
        elem:=Random(2);
        case elem of
        0: textcolor(8) ;
        1: textcolor(15);
        end;
    end;
PROCEDURE elemcolor3;
    begin
        Textcolor(13);
    end;
PROCEDURE closealltxt;
    begin
        Close(GerCom);
        Close(ZvezCom);
        Close(GerMys);
        Close(ZvezMys);
        Close(GerLeg);
        Close(ZvezLeg);
    end;
PROCEDURE IntoGazetaName;
    begin
        Reset(GerCom);
        for i := 0 to 92 do begin
            Readln(GerCom,imya);
            hero[i].name:=imya;
        end;
    end;
PROCEDURE IntoGazetaStar;
    begin
        Reset(ZvezCom);
        for i := 0 to 92 do begin
            Readln(ZvezCom,zvezda);
            hero[i].star:=zvezda;
        end;
    end;
PROCEDURE OpenGazeta;
    begin
        for rand:= 1 to scroll do begin
            RandNum:=random(1000);
            if RandNum<2   then begin i:=61+random(34);th:=th+1;awak:=awak+1;elemcolor3; end else  //0.2% - 3* awakened
            if RandNum<29  then begin i:=23+random(3) ;tw:=tw+1;awak:=awak+1;elemcolor3; end else  //2.9% - 2* awakened
            if RandNum<30  then begin i:=26+random(34);th:=th+1;elemcolor1;              end else  //  3% - 3*
            if RandNum<350 then begin i:=7 +random(16);tw:=tw+1;elemcolor1;              end else  // 31% - 2*
            begin i:=random(7);one:=one+1;elemcolor1; end;
            Writeln(hero[i].star,'* ',hero[i].name);
        end;
    end;
PROCEDURE Gazeta;
    begin
        IntoGazetaName;
        IntoGazetaStar;
        OpenGazeta;
    end;
PROCEDURE Mystic;
    begin
        Reset(GerMys);
        for i := 0 to 275 do begin     //ИмяМистик
            Readln(GerMys,imya);
            hero[i].name:=imya;
        end;
        Reset(ZvezMys);
        for i := 0 to 275 do begin     //ЗвездаМистик
            Readln(ZvezMys,zvezda);
            hero[i].star:=zvezda;
        end;
        for rand:= 1 to scroll do begin                   //ОТКРЫТИЕ МИСТИКА
            RandNum:=random(1000);
            if RandNum<2   then begin i:=182+random(94) ;fi:=fi+1;awak:=awak+1;elemcolor3; end else //0.2% - 5* awakened
            if RandNum<17  then begin i:=164+random(18) ;fi:=fi+1;elemcolor1;              end else //1.7% - 5*
            if RandNum<20  then begin i:=35 +random(98) ;fo:=fo+1;awak:=awak+1;elemcolor3; end else //2%   - 4* awakened
            if RandNum<150 then begin i:=132+random(31) ;fo:=fo+1;elemcolor1;              end else //15%  - 4*
            begin i:=random(34);th:=th+1;elemcolor1; end;
            Writeln(hero[i].star,'* ',hero[i].name);
        end;
    end;
PROCEDURE Legend;
    begin
        Reset(GerLeg);
        for i := 0 to 141 do begin     //ИмяЛега
            Readln(GerLeg,imya);
            hero[i].name:=imya;
        end;
        Reset(ZvezLeg);
        for i := 0 to 141 do begin     //ЗвездаЛега
            Readln(ZvezLeg,zvezda);
            hero[i].star:=zvezda;
        end;
        for rand:= 1 to scroll do begin                  //ОТКРЫТИЕ ЛЕГИ
            RandNum:=random(1000);
            if RandNum<5   then begin i:=47+random(94) ;fi:=fi+1;awak:=awak+1;elemcolor3; end else //0.5%   - 5* awakened
            if RandNum<45 then begin i:=29+random(18) ;fi:=fi+1;            elemcolor1; end else   //4.5%   - 5*
            begin i:=random(29);fo:=fo+1; elemcolor1;  end;
            Writeln(hero[i].star,'* ',hero[i].name);
        end;
    end;
PROCEDURE LightDark;
    begin
        Reset(GerLD);
        for i := 0 to 155 do begin     //ИмяЛД
            Readln(GerLD,imya);
            hero[i].name:=imya;
        end;
        Reset(ZvezLD);
        for i := 0 to 155 do begin     //ЗвездаЛД
            Readln(ZvezLD,zvezda);
            hero[i].star:=zvezda;
        end;
        for rand:= 1 to scroll do begin                   //ОТКРЫТИЕ ЛД
            RandNum:=random(1000);
            if RandNum<2   then begin i:=125+random(30) ;fi:=fi+1;awak:=awak+1;elemcolor3; end else //0.2% - 5* awakened
            if RandNum<20  then begin i:=102+random(23) ;fi:=fi+1;             elemcolor2; end else //2%   - 5*
            if RandNum<20  then begin i:=66 +random(36) ;fo:=fo+1;awak:=awak+1;elemcolor3; end else //2%   - 4* awakened
            if RandNum<140 then begin i:=36+random (30) ;fo:=fo+1;             elemcolor2; end else //14%  - 4*
            begin i:=random(36); th:=th+1; elemcolor2; end;
            Writeln(hero[i].star,'* ',hero[i].name);
        end;
    end;
BEGIN
    Assign(GerCom, 'heronameCommon.txt');
    Assign(ZvezCom,'herostarCommon.txt');
    Assign(GerMys, 'heronameMystic.txt');
    Assign(ZvezMys,'herostarMystic.txt');
    Assign(GerLD,  'heronameLD.txt');
    Assign(ZvezLD, 'herostarLD.txt');
    Assign(GerLeg, 'heronameLeg.txt');
    Assign(ZvezLeg,'herostarLeg.txt');
    Writeln('Сколько открыть свитков?');
    Readln(scroll);
    Writeln('Какой свиток? (газета/мистик/лд/лега)');
    Readln(otvet);
    Randomize;
    awak:=0;
    one :=0;
    tw  :=0;
    th  :=0;
    fo  :=0;
    fi  :=0;
    if otvet='газета' then begin
        gazeta;
        textcolor(15);
        Writeln('');
        Writeln('Получено: 1* - ',one,', 2* - ',tw,', 3* - ',th,', пробуждённых - ',awak);
    end;
    if otvet='мистик' then begin
        Mystic;
        textcolor(15);
        Writeln('');
        Writeln('Получено: 3* - ',th,', 4* - ',fo,', 5* - ',fi,' (пробуждённых - ',awak,')');
    end;
    if otvet='лега' then begin
        Legend;
        textcolor(15);
        Writeln('');
        Writeln('Получено: 4* - ',fo,', 5* - ',fi,' (пробуждённых - ',awak,')');
    end;
        if otvet='лд' then begin
        LightDark;
        textcolor(15);
        Writeln('');
        Writeln('Получено: 3* - ',th,', 4* - ',fo,', 5* - ',fi,' (пробуждённых - ',awak,')');
    Readln;
    end;
    Readln;
    closealltxt;
END.



