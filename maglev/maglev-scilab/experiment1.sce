mag1 = createWindow();

///////Titile///////////////
name=uicontrol(mag1,"style","text");
name.Units="normalized";
name.Position = [0.01,0.9,1,0.08]//[lmargin topmargin width height];
name.String = "Maglev Experiment 1: Plant Modelling                        Given: N=4 and u0=1.187*a*(y0+b)^N        Transfer Function: P(s)=q/(m*s^2+c*s+r)";
name.BackgroundColor = [0.5,0.6,0.8];


global value_DC1 value_zeta value_wn1 DC_chk zeta_chk wn_chk a1_value b1_value m1_value c1_value y01_value N;
N=4;
/////////////**** START 1 ****////////////
a1_value=1.33;
b1_value=6.2;
m1_value=0.121;
c1_value=0.4;
y01_value=2;
///////////////////
value_a1=uicontrol(mag1,"style","text");
value_a1.Units="normalized";
value_a1.Position = [0.01,0.8,0.15,0.08]//[lmargin topmargin width height];
value_a1.String = "a = "+string(a1_value);
value_a1.Value = a1_value;
value_a1.BackgroundColor = [0.8,0.8,0.8];
//////////////

value_b1=uicontrol(mag1,"style","text");
value_b1.Units="normalized";
value_b1.Position = [0.2,0.8,0.15,0.08]//[lmargin topmargin width height];
value_b1.String = "b = "+string(b1_value);
value_b1.Value = b1_value;
value_b1.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_m1=uicontrol(mag1,"style","text");
value_m1.Units="normalized";
value_m1.Position = [0.58,0.8,0.15,0.08]//[lmargin topmargin width height];
value_m1.String = "m = "+string(m1_value);
value_m1.Value = m1_value;
value_m1.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_c1=uicontrol(mag1,"style","text");
value_c1.Units="normalized";
value_c1.Position = [0.39,0.8,0.15,0.08]//[lmargin topmargin width height];
value_c1.String = "c = "+string(c1_value);
value_c1.Value = c1_value;
value_c1.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_y01=uicontrol(mag1,"style","text");
value_y01.Units="normalized";
value_y01.Position = [0.77,0.8,0.15,0.08]//[lmargin topmargin width height];
value_y01.String = "y0 = "+string(y01_value);
value_y01.Value = y01_value;
value_y01.BackgroundColor = [0.8,0.8,0.8];

////////////////
tag_DC1=uicontrol(mag1,"style","text");
tag_DC1.Units="normalized";
tag_DC1.Position = [0.2,0.7,0.15,0.08]//[lmargin topmargin width height];
tag_DC1.String = " DC value = ";
tag_DC1.Value = 0;
tag_DC1.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_DC1=uicontrol(mag1,"style","edit");
value_DC1.Units="normalized";
value_DC1.Position = [0.32,0.71,0.1,0.06]//[lmargin topmargin width height];
value_DC1.String = "0";
value_DC1.Value = 0;
value_DC1.BackgroundColor = [0.7,0.8,0.8];


////////////////
tag_zeta=uicontrol(mag1,"style","text");
tag_zeta.Units="normalized";
tag_zeta.Position = [0.46,0.7,0.15,0.08]//[lmargin topmargin width height];
tag_zeta.String = " zeta = ";
tag_zeta.Value = 0;
tag_zeta.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_zeta=uicontrol(mag1,"style","edit");
value_zeta.Units="normalized";
value_zeta.Position = [0.54,0.71,0.1,0.06]//[lmargin topmargin width height];
value_zeta.String = "0";
value_zeta.Value = 0;
value_zeta.BackgroundColor = [0.7,0.8,0.8];

////////////////
tag_wn=uicontrol(mag1,"style","text");
tag_wn.Units="normalized";
tag_wn.Position = [0.68,0.7,0.15,0.08]//[lmargin topmargin width height];
tag_wn.String = " wn = ";
tag_wn.Value = 0;
tag_wn.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_wn=uicontrol(mag1,"style","edit");
value_wn.Units="normalized";
value_wn.Position = [0.75,0.71,0.1,0.06]//[lmargin topmargin width height];
value_wn.String = "0";
value_wn.Value = 0;
value_wn.BackgroundColor = [0.7,0.8,0.8];

/////
function [dc,zt,omega_n]=calc(a,b,c,m,y0)
    u0=1.187*a*(y0+b)^N;

    s=%s;
    r=(N*u0)/(a*(y0+b)^(N+1));
    num=1/(a*(y0+b)^N);
    den=m*s^2+c*s+r;
    
    dc=num/m;
    den=den/m;
    
    cf=coeff(den);
    omega_n=sqrt(cf(2));
    zt = cf(2)/(2*omega_n);
    disp("inside calc")
endfunction
/////
function check1()
    //check1(a1_value,b1_value,c1_value,m1_value,y01_value)
    //global summ answer DC_chk zeta_chk wn_chk
    //[dc,zt,omega_n]=calc(a1_value,b1_value,c1_value,m1_value,y01_value)
    //DC_chk.String = "Correct";
//    dc=1;
//    if dc==1
//        DC_chk.String = "Correct";
//    else 
//        DC_chk.String = "Incorrect";
//    end
    disp("inside check1");
endfunction

function chk1()
    global DC_chk value_DC1 value_zeta value_wn1 zeta_chk wn_chk
    [dc,zt,omega_n]=calc(a1_value,b1_value,c1_value,m1_value,y01_value)
    //disp(dc)
    //disp(value_DC1.string)
    if abs((strtod(value_DC1.string)-dc))<0.0001
        DC_chk.String = "Correct";
    else
        DC_chk.String = "Incorrect";
    end
    
    //disp(zt)
    //disp(value_zeta.string)
    if abs((strtod(value_zeta.string)-zt))<0.01
        zeta_chk.String = "Correct";
    else
        zeta_chk.String = "Incorrect";
    end
    
    //disp(omega_n)
    //disp(value_wn.string)
    if abs((strtod(value_wn.string)-omega_n))<0.001
        wn_chk.String = "Correct";
    else
        wn_chk.String = "Incorrect";
    end
endfunction

////
check1=uicontrol(mag1,"style","pushbutton");
check1.Units="normalized";
check1.Position = [0.86,0.71,0.12,0.06]//[lmargin topmargin width height];
check1.String = "Check";
check1.Callback = "chk1";
check1.Relief="raised";
check1.BackgroundColor = [0.8,0.8,0.8];

////////////////
DC_chk=uicontrol(mag1,"style","text");
DC_chk.Units="normalized";
DC_chk.Position = [0.35,0.62,0.15,0.08]//[lmargin topmargin width height];
DC_chk.String = " ! ";
DC_chk.Value = 0;
DC_chk.BackgroundColor = [0.8,0.8,0.8];

////////////////
zeta_chk=uicontrol(mag1,"style","text");
zeta_chk.Units="normalized";
zeta_chk.Position = [0.58,0.62,0.15,0.08]//[lmargin topmargin width height];
zeta_chk.String = " ! ";
zeta_chk.Value = 0;
zeta_chk.BackgroundColor = [0.8,0.8,0.8];

////////////////
wn_chk=uicontrol(mag1,"style","text");
wn_chk.Units="normalized";
wn_chk.Position = [0.78,0.62,0.15,0.08]//[lmargin topmargin width height];
wn_chk.String = " ! ";
wn_chk.Value = 0;
wn_chk.BackgroundColor = [0.8,0.8,0.8];





/////////////**** START 2 ****////////////

global a2_value b2_value m2_value c2_value y02_value value_DC2 value_zeta2 value_wn2 DC_chk2 zeta_chk2 wn_chk2

a2_value=1.33;
b2_value=6.2;
m2_value=0.25;
c2_value=0.5;
y02_value=2.5;

///////////////////
value_a2=uicontrol(mag1,"style","text");
value_a2.Units="normalized";
value_a2.Position = [0.01,0.5,0.15,0.08]//[lmargin topmargin width height];
value_a2.String = "a = "+string(a2_value);
value_a2.Value = a2_value;
value_a2.BackgroundColor = [0.8,0.8,0.8];


//////////////
value_b2=uicontrol(mag1,"style","text");
value_b2.Units="normalized";
value_b2.Position = [0.2,0.5,0.15,0.08]//[lmargin topmargin width height];
value_b2.String = "b = "+string(b2_value);
value_b2.Value = b2_value;
value_b2.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_m2=uicontrol(mag1,"style","text");
value_m2.Units="normalized";
value_m2.Position = [0.58,0.5,0.15,0.08]//[lmargin topmargin width height];
value_m2.String = "m = "+string(m2_value);
value_m2.Value = m2_value;
value_m2.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_c2=uicontrol(mag1,"style","text");
value_c2.Units="normalized";
value_c2.Position = [0.39,0.5,0.15,0.08]//[lmargin topmargin width height];
value_c2.String = "c = "+string(c2_value);
value_c2.Value = c2_value;
value_c2.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_y02=uicontrol(mag1,"style","text");
value_y02.Units="normalized";
value_y02.Position = [0.77,0.5,0.15,0.08]//[lmargin topmargin width height];
value_y02.String = "y0 = "+string(y02_value);
value_y02.Value = y02_value;
value_y02.BackgroundColor = [0.8,0.8,0.8];

////////////////
tag_DC2=uicontrol(mag1,"style","text");
tag_DC2.Units="normalized";
tag_DC2.Position = [0.2,0.4,0.15,0.08]//[lmargin topmargin width height];
tag_DC2.String = " DC value = ";
tag_DC2.Value = 0;
tag_DC2.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_DC2=uicontrol(mag1,"style","edit");
value_DC2.Units="normalized";
value_DC2.Position = [0.32,0.4,0.1,0.06]//[lmargin topmargin width height];
value_DC2.String = "0";
value_DC2.Value = 0;
value_DC2.BackgroundColor = [0.7,0.8,0.8];


////////////////
tag_zeta2=uicontrol(mag1,"style","text");
tag_zeta2.Units="normalized";
tag_zeta2.Position = [0.46,0.4,0.15,0.08]//[lmargin topmargin width height];
tag_zeta2.String = " zeta = ";
tag_zeta2.Value = 0;
tag_zeta2.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_zeta2=uicontrol(mag1,"style","edit");
value_zeta2.Units="normalized";
value_zeta2.Position = [0.54,0.4,0.1,0.06]//[lmargin topmargin width height];
value_zeta2.String = "0";
value_zeta2.Value = 0;
value_zeta2.BackgroundColor = [0.7,0.8,0.8];

////////////////
tag_wn2=uicontrol(mag1,"style","text");
tag_wn2.Units="normalized";
tag_wn2.Position = [0.68,0.4,0.15,0.08]//[lmargin topmargin width height];
tag_wn2.String = " wn = ";
tag_wn2.Value = 0;
tag_wn2.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_wn2=uicontrol(mag1,"style","edit");
value_wn2.Units="normalized";
value_wn2.Position = [0.75,0.4,0.1,0.06]//[lmargin topmargin width height];
value_wn2.String = "0";
value_wn2.Value = 0;
value_wn2.BackgroundColor = [0.7,0.8,0.8];

/////
//function [dc,zt,omega_n]=calc(a,b,c,m,y0)
//    u0=1.187*a*(y0+b)^N;
//
//    s=%s;
//    r=(N*u0)/(a*(y0+b)^(N+1));
//    num=1/(a*(y0+b)^N);
//    den=m*s^2+c*s+r;
//    
//    dc=num/m;
//    den=den/m;
//    
//    cf=coeff(den);
//    omega_n=sqrt(cf(2));
//    zt = cf(2)/(2*omega_n);
//    //disp("inside calc")
//endfunction


function chk2()
    global DC_chk2 value_DC2 value_zeta2 value_wn2 zeta_chk2 wn_chk2
    [dc2,zt2,omega_n2]=calc(a2_value,b2_value,c2_value,m2_value,y02_value)
    //disp(dc2)
    //disp(value_DC2.string)
    if abs((strtod(value_DC2.string)-dc2))<0.0001
        DC_chk2.String = "Correct";
    else
        DC_chk2.String = "Incorrect";
    end
    
    //disp(zt2)
    //disp(value_zeta2.string)
    if abs((strtod(value_zeta2.string)-zt2))<0.01
        zeta_chk2.String = "Correct";
    else
        zeta_chk2.String = "Incorrect";
    end
    
    //disp(omega_n2)
    //disp(value_wn2.string)
    if abs((strtod(value_wn2.string)-omega_n2))<0.001
        wn_chk2.String = "Correct";
    else
        wn_chk2.String = "Incorrect";
    end
endfunction

////
check2=uicontrol(mag1,"style","pushbutton");
check2.Units="normalized";
check2.Position = [0.86,0.4,0.12,0.06]//[lmargin topmargin width height];
check2.String = "Check";
check2.Callback = "chk2";
check2.Relief="raised";
check2.BackgroundColor = [0.8,0.8,0.8];

////////////////
DC_chk2=uicontrol(mag1,"style","text");
DC_chk2.Units="normalized";
DC_chk2.Position = [0.35,0.3,0.15,0.08]//[lmargin topmargin width height];
DC_chk2.String = " ! ";
DC_chk2.Value = 0;
DC_chk2.BackgroundColor = [0.8,0.8,0.8];

////////////////
zeta_chk2=uicontrol(mag1,"style","text");
zeta_chk2.Units="normalized";
zeta_chk2.Position = [0.58,0.3,0.15,0.08]//[lmargin topmargin width height];
zeta_chk2.String = " ! ";
zeta_chk2.Value = 0;
zeta_chk2.BackgroundColor = [0.8,0.8,0.8];

////////////////
wn_chk2=uicontrol(mag1,"style","text");
wn_chk2.Units="normalized";
wn_chk2.Position = [0.78,0.3,0.15,0.08]//[lmargin topmargin width height];
wn_chk2.String = " ! ";
wn_chk2.Value = 0;
wn_chk2.BackgroundColor = [0.8,0.8,0.8];




/////////////**** START 3 ****////////////

global a3_value b3_value m3_value c3_value y03_value value_DC3 value_zeta3 value_wn3 DC_chk3 zeta_chk3 wn_chk3

a3_value=1.33;
b3_value=6.2;
m3_value=0.05;
c3_value=0.6;
y03_value=3;

///////////////////
value_a3=uicontrol(mag1,"style","text");
value_a3.Units="normalized";
value_a3.Position = [0.01,0.2,0.15,0.08]//[lmargin topmargin width height];
value_a3.String = "a = "+string(a3_value);
value_a3.Value = a3_value;
value_a3.BackgroundColor = [0.8,0.8,0.8];


//////////////
value_b3=uicontrol(mag1,"style","text");
value_b3.Units="normalized";
value_b3.Position = [0.2,0.2,0.15,0.08]//[lmargin topmargin width height];
value_b3.String = "b = "+string(b3_value);
value_b3.Value = b3_value;
value_b3.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_m3=uicontrol(mag1,"style","text");
value_m3.Units="normalized";
value_m3.Position = [0.58,0.2,0.15,0.08]//[lmargin topmargin width height];
value_m3.String = "m = "+string(m3_value);
value_m3.Value = m3_value;
value_m3.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_c3=uicontrol(mag1,"style","text");
value_c3.Units="normalized";
value_c3.Position = [0.39,0.2,0.15,0.08]//[lmargin topmargin width height];
value_c3.String = "c = "+string(c3_value);
value_c3.Value = c3_value;
value_c3.BackgroundColor = [0.8,0.8,0.8];


////////////////
value_y03=uicontrol(mag1,"style","text");
value_y03.Units="normalized";
value_y03.Position = [0.77,0.2,0.15,0.08]//[lmargin topmargin width height];
value_y03.String = "y0 = "+string(y03_value);
value_y03.Value = y03_value;
value_y03.BackgroundColor = [0.8,0.8,0.8];

////////////////
tag_DC3=uicontrol(mag1,"style","text");
tag_DC3.Units="normalized";
tag_DC3.Position = [0.2,0.1,0.15,0.08]//[lmargin topmargin width height];
tag_DC3.String = " DC value = ";
tag_DC3.Value = 0;
tag_DC3.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_DC3=uicontrol(mag1,"style","edit");
value_DC3.Units="normalized";
value_DC3.Position = [0.33,0.11,0.1,0.06]//[lmargin topmargin width height];
value_DC3.String = "0";
value_DC3.Value = 0;
value_DC3.BackgroundColor = [0.7,0.8,0.8];


////////////////
tag_zeta3=uicontrol(mag1,"style","text");
tag_zeta3.Units="normalized";
tag_zeta3.Position = [0.46,0.1,0.15,0.08]//[lmargin topmargin width height];
tag_zeta3.String = " zeta = ";
tag_zeta3.Value = 0;
tag_zeta3.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_zeta3=uicontrol(mag1,"style","edit");
value_zeta3.Units="normalized";
value_zeta3.Position = [0.54,0.11,0.1,0.06]//[lmargin topmargin width height];
value_zeta3.String = "0";
value_zeta3.Value = 0;
value_zeta3.BackgroundColor = [0.7,0.8,0.8];

////////////////
tag_wn3=uicontrol(mag1,"style","text");
tag_wn3.Units="normalized";
tag_wn3.Position = [0.68,0.1,0.15,0.08]//[lmargin topmargin width height];
tag_wn3.String = " wn = ";
tag_wn3.Value = 0;
tag_wn3.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_wn3=uicontrol(mag1,"style","edit");
value_wn3.Units="normalized";
value_wn3.Position = [0.75,0.11,0.1,0.06]//[lmargin topmargin width height];
value_wn3.String = "0";
value_wn3.Value = 0;
value_wn3.BackgroundColor = [0.7,0.8,0.8];

/////
//function [dc,zt,omega_n]=calc(a,b,c,m,y0)
//    u0=1.187*a*(y0+b)^N;
//
//    s=%s;
//    r=(N*u0)/(a*(y0+b)^(N+1));
//    num=1/(a*(y0+b)^N);
//    den=m*s^3+c*s+r;
//    
//    dc=num/m;
//    den=den/m;
//    
//    cf=coeff(den);
//    omega_n=sqrt(cf(3));
//    zt = cf(3)/(2*omega_n);
//    //disp("inside calc")
//endfunction


function chk3()
    global DC_chk3 value_DC3 value_zeta3 value_wn3 zeta_chk3 wn_chk3
    [dc3,zt3,omega_n3]=calc(a3_value,b3_value,c3_value,m3_value,y03_value)
    //disp(dc3)
    //disp(value_DC3.string)
    if abs((strtod(value_DC3.string)-dc3))<0.0001
        DC_chk3.String = "Correct";
    else
        DC_chk3.String = "Incorrect";
    end
    
    //disp(zt3)
    //disp(value_zeta3.string)
    if abs((strtod(value_zeta3.string)-zt3))<0.01
        zeta_chk3.String = "Correct";
    else
        zeta_chk3.String = "Incorrect";
    end
    
    //disp(omega_n3)
    //disp(value_wn3.string)
    if abs((strtod(value_wn3.string)-omega_n3))<0.001
        wn_chk3.String = "Correct";
    else
        wn_chk3.String = "Incorrect";
    end
endfunction

////
check3=uicontrol(mag1,"style","pushbutton");
check3.Units="normalized";
check3.Position = [0.86,0.11,0.13,0.06]//[lmargin topmargin width height];
check3.String = "Check";
check3.Callback = "chk3";
check3.Relief="raised";
check3.BackgroundColor = [0.8,0.8,0.8];

////////////////
DC_chk3=uicontrol(mag1,"style","text");
DC_chk3.Units="normalized";
DC_chk3.Position = [0.35,0.03,0.15,0.08]//[lmargin topmargin width height];
DC_chk3.String = " ! ";
DC_chk3.Value = 0;
DC_chk3.BackgroundColor = [0.8,0.8,0.8];

////////////////
zeta_chk3=uicontrol(mag1,"style","text");
zeta_chk3.Units="normalized";
zeta_chk3.Position = [0.58,0.03,0.15,0.08]//[lmargin topmargin width height];
zeta_chk3.String = " ! ";
zeta_chk3.Value = 0;
zeta_chk3.BackgroundColor = [0.8,0.8,0.8];

////////////////
wn_chk3=uicontrol(mag1,"style","text");
wn_chk3.Units="normalized";
wn_chk3.Position = [0.78,0.03,0.15,0.08]//[lmargin topmargin width height];
wn_chk3.String = " ! ";
wn_chk3.Value = 0;
wn_chk3.BackgroundColor = [0.8,0.8,0.8];
