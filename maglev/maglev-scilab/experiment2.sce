clear all;
clear;

mag2 = createWindow();
global sys

///////Titile///////////////
name=uicontrol(mag2,"style","text");
name.Units="normalized";
name.Position = [0.01,0.9,1,0.08]//[lmargin topmargin width height];
name.String = "Maglev Experiment 2: Transient Response                   Given: N=4 and u0=1.187*a*(y0+b)^N        Transfer Function: P(s)=q/(m*s^2+c*s+r)";
name.BackgroundColor = [0.5,0.6,0.8];




///////////// For a /////////////
global eb_a value_a
function updateslider_kp(value_a)
   global eb_a value_a;
   eb_a.Value = value_a.Value;
   eb_a.String = msprintf('%5.3f',eb_a.Value);
  
endfunction

value_a=uicontrol(mag2, "style","slider");
value_a.Min=0.001;
value_a.Max=100;
value_a.Value=0.001;
value_a.Units="normalized";
value_a.Position=[0.1,0.7,0.2,0.08];
value_a.Callback="updateslider_kp";

// ----- left text -----
a_label=uicontrol(mag2,"style","text");
a_label.Units="normalized";
a_label.Position = [0.04,0.7,0.04,0.08];
a_label.String = "$a$";
a_label.BackgroundColor = [0.8,0.8,0.8];

function updateedit_kp(eb_a)
    global value_a eb_a;
    eb_a.Value = eval(eb_a.String);
    if (eb_a.Value < 0)
        disp('Kp value below range. Set to minimum');
        eb_a.Value = 0;
        eb_a.String = msprintf('%5.3f',eb_a.Value);
    elseif (eb_a.Value > 100)
        disp('Kp value above range. Set to maximum');
        eb_a.Value = 100;
        eb_a.String = msprintf('%5.3f',eb_a.Value);            
    end
    value_a.Value = eb_a.Value;
endfunction


eb_a=uicontrol(mag2,"style","edit");
eb_a.String = msprintf('%5.3f',0);
eb_a.Value = 0.001;
eb_a.Units="normalized";
eb_a.Position=[0.35,0.7,0.15,0.08];
eb_a.Callback = "updateedit_kp";


/////////**** For b ****/////////////
global eb_b value_b
function updateslider_b(value_b)
   global eb_b value_b;
   eb_b.Value = value_b.Value;
   eb_b.String = msprintf('%5.3f',eb_b.Value);
  
endfunction

value_b=uicontrol(mag2, "style","slider");
value_b.Min=0.001;
value_b.Max=100;
value_b.Value=0.001;
value_b.Units="normalized";
value_b.Position=[0.1,0.6,0.2,0.08];
value_b.Callback="updateslider_b";

// ----- left text -----
b_label=uicontrol(mag2,"style","text");
b_label.Units="normalized";
b_label.Position = [0.04,0.6,0.04,0.08];
b_label.String = "$b$";
b_label.BackgroundColor = [0.8,0.8,0.8];

function updateedit_b(eb_b)
    global value_b eb_b;
    eb_b.Value = eval(eb_b.String);
    if (eb_b.Value < 0)
        disp('Kp value below range. Set to minimum');
        eb_b.Value = 0;
        eb_b.String = msprintf('%5.3f',eb_b.Value);
    elseif (eb_b.Value > 100)
        disp('Kp value above range. Set to maximum');
        eb_b.Value = 100;
        eb_b.String = msprintf('%5.3f',eb_b.Value);            
    end
    value_b.Value = eb_b.Value;
endfunction


eb_b=uicontrol(mag2,"style","edit");
eb_b.String = msprintf('%5.3f',0);
eb_b.Value = 0.001;
eb_b.Units="normalized";
eb_b.Position=[0.35,0.6,0.15,0.08];
eb_b.Callback = "updateedit_b";


/////////**** For m ****/////////////
global eb_m value_m
function updateslider_m(value_m)
   global eb_m value_m;
   eb_m.Value = value_m.Value;
   eb_m.String = msprintf('%5.3f',eb_m.Value);
  
endfunction

value_m=uicontrol(mag2, "style","slider");
value_m.Min=0.001;
value_m.Max=100;
value_m.Value=0.001;
value_m.Units="normalized";
value_m.Position=[0.1,0.5,0.2,0.08];
value_m.Callback="updateslider_m";

// ----- left text -----
m_label=uicontrol(mag2,"style","text");
m_label.Units="normalized";
m_label.Position = [0.04,0.5,0.04,0.08];
m_label.String = "$m$";
m_label.BackgroundColor = [0.8,0.8,0.8];

function updateedit_m(eb_m)
    global value_m eb_m;
    eb_m.Value = eval(eb_m.String);
    if (eb_m.Value < 0)
        disp('Kp value below range. Set to minimum');
        eb_m.Value = 0;
        eb_m.String = msprintf('%5.3f',eb_m.Value);
    elseif (eb_m.Value > 100)
        disp('Kp value above range. Set to maximum');
        eb_m.Value = 100;
        eb_m.String = msprintf('%5.3f',eb_m.Value);            
    end
    value_m.Value = eb_m.Value;
endfunction


eb_m=uicontrol(mag2,"style","edit");
eb_m.String = msprintf('%5.3f',0);
eb_m.Value = 0.001;
eb_m.Units="normalized";
eb_m.Position=[0.35,0.5,0.15,0.08];
eb_m.Callback = "updateedit_m";


/////////**** For c ****/////////////
global eb_c value_c
function updateslider_c(value_c)
   global eb_c value_c;
   eb_c.Value = value_c.Value;
   eb_c.String = msprintf('%5.3f',eb_c.Value);
  
endfunction

value_c=uicontrol(mag2, "style","slider");
value_c.Min=0.001;
value_c.Max=100;
value_c.Value=0.001;
value_c.Units="normalized";
value_c.Position=[0.1,0.4,0.2,0.08];
value_c.Callback="updateslider_c";

// ----- left text -----
c_label=uicontrol(mag2,"style","text");
c_label.Units="normalized";
c_label.Position = [0.04,0.4,0.04,0.08];
c_label.String = "$c$";
c_label.BackgroundColor = [0.8,0.8,0.8];

function updateedit_c(eb_c)
    global value_c eb_c;
    eb_c.Value = eval(eb_c.String);
    if (eb_c.Value < 0)
        disp('Kp value below range. Set to minimum');
        eb_c.Value = 0;
        eb_c.String = msprintf('%5.3f',eb_c.Value);
    elseif (eb_c.Value > 100)
        disp('Kp value above range. Set to maximum');
        eb_c.Value = 100;
        eb_c.String = msprintf('%5.3f',eb_c.Value);            
    end
    value_c.Value = eb_c.Value;
endfunction


eb_c=uicontrol(mag2,"style","edit");
eb_c.String = msprintf('%5.3f',0);
eb_c.Value = 0.001;
eb_c.Units="normalized";
eb_c.Position=[0.35,0.4,0.15,0.08];
eb_c.Callback = "updateedit_c";


/////////**** For c ****/////////////
global eb_y0 value_y0
function updateslider_y0(value_y0)
   global eb_y0 value_y0;
   eb_y0.Value = value_y0.Value;
   eb_y0.String = msprintf('%5.3f',eb_y0.Value);
  
endfunction

value_y0=uicontrol(mag2, "style","slider");
value_y0.Min=0.001;
value_y0.Max=100;
value_y0.Value=0.001;
value_y0.Units="normalized";
value_y0.Position=[0.1,0.3,0.2,0.08];
value_y0.Callback="updateslider_y0";

// ----- left text -----
y0_label=uicontrol(mag2,"style","text");
y0_label.Units="normalized";
y0_label.Position = [0.04,0.3,0.04,0.08];
y0_label.String = "$y_0$";
y0_label.BackgroundColor = [0.8,0.8,0.8];

function updateedit_y0(eb_y0)
    global value_y0 eb_y0;
    eb_y0.Value = eval(eb_y0.String);
    if (eb_y0.Value < 0)
        disp('Kp value below range. Set to minimum');
        eb_y0.Value = 0;
        eb_y0.String = msprintf('%5.3f',eb_y0.Value);
    elseif (eb_y0.Value > 100)
        disp('Kp value above range. Set to maximum');
        eb_y0.Value = 100;
        eb_y0.String = msprintf('%5.3f',eb_y0.Value);            
    end
    value_y0.Value = eb_y0.Value;
endfunction


eb_y0=uicontrol(mag2,"style","edit");
eb_y0.String = msprintf('%5.3f',0);
eb_y0.Value = 0.001;
eb_y0.Units="normalized";
eb_y0.Position=[0.35,0.3,0.15,0.08];
eb_y0.Callback = "updateedit_y0";

/////#####********#########/////////
/////#####********#########/////////
/////#####********#########/////////
/////#####********#########/////////
/////#####********#########/////////


////////////////
tag_DC1=uicontrol(mag2,"style","text");
tag_DC1.Units="normalized";
tag_DC1.Position = [0.55,0.7,0.8,0.08]//[lmargin topmargin width height];
tag_DC1.String = " DC value = ";
tag_DC1.Value = 0;
tag_DC1.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_DC1=uicontrol(mag2,"style","edit");
value_DC1.Units="normalized";
value_DC1.Position = [0.67,0.71,0.1,0.06]//[lmargin topmargin width height];
value_DC1.String = "0";
value_DC1.Value = 0;
value_DC1.BackgroundColor = [0.7,0.8,0.8];



////////////////
tag_zeta=uicontrol(mag2,"style","text");
tag_zeta.Units="normalized";
tag_zeta.Position = [0.55,0.6,0.8,0.08]//[lmargin topmargin width height];
tag_zeta.String = " zeta = ";
tag_zeta.Value = 0;
tag_zeta.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_zeta=uicontrol(mag2,"style","edit");
value_zeta.Units="normalized";
value_zeta.Position = [0.67,0.61,0.1,0.06]//[lmargin topmargin width height];
value_zeta.String = "0";
value_zeta.Value = 0;
value_zeta.BackgroundColor = [0.7,0.8,0.8];

////////////////
tag_wn=uicontrol(mag2,"style","text");
tag_wn.Units="normalized";
tag_wn.Position = [0.55,0.5,0.8,0.08]//[lmargin topmargin width height];
tag_wn.String = " wn = ";
tag_wn.Value = 0;
tag_wn.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_wn=uicontrol(mag2,"style","edit");
value_wn.Units="normalized";
value_wn.Position = [0.67,0.51,0.1,0.06]//[lmargin topmargin width height];
value_wn.String = "0";
value_wn.Value = 0;
value_wn.BackgroundColor = [0.7,0.8,0.8];

//////////////
tag_tr=uicontrol(mag2,"style","text");
tag_tr.Units="normalized";
tag_tr.Position = [0.55,0.4,0.8,0.08]//[lmargin topmargin width height];
tag_tr.String = " tr = ";
tag_tr.Value = 0;
tag_tr.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_tr=uicontrol(mag2,"style","edit");
value_tr.Units="normalized";
value_tr.Position = [0.67,0.41,0.1,0.06]//[lmargin topmargin width height];
value_tr.String = "0";
value_tr.Value = 0;
value_tr.BackgroundColor = [0.7,0.8,0.8];

///////////
//////////////
tag_ts=uicontrol(mag2,"style","text");
tag_ts.Units="normalized";
tag_ts.Position = [0.55,0.3,0.8,0.08]//[lmargin topmargin width height];
tag_ts.String = " ts = ";
tag_ts.Value = 0;
tag_ts.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_ts=uicontrol(mag2,"style","edit");
value_ts.Units="normalized";
value_ts.Position = [0.67,0.31,0.1,0.06]//[lmargin topmargin width height];
value_ts.String = "0";
value_ts.Value = 0;
value_ts.BackgroundColor = [0.7,0.8,0.8];
////////////////

//////////////
tag_mp=uicontrol(mag2,"style","text");
tag_mp.Units="normalized";
tag_mp.Position = [0.55,0.2,0.8,0.08]//[lmargin topmargin width height];
tag_mp.String = " mp = ";
tag_mp.Value = 0;
tag_mp.BackgroundColor = [0.8,0.8,0.8];

////////////////
value_mp=uicontrol(mag2,"style","edit");
value_mp.Units="normalized";
value_mp.Position = [0.67,0.21,0.1,0.06]//[lmargin topmargin width height];
value_mp.String = "0";
value_mp.Value = 0;
value_mp.BackgroundColor = [0.7,0.8,0.8];

///////////
global DC_chk
DC_chk=uicontrol(mag2,"style","text");
DC_chk.Units="normalized";
DC_chk.Position = [0.8,0.7,0.15,0.08]//[lmargin topmargin width height];
DC_chk.String = " ! ";
DC_chk.Value = 0;
DC_chk.BackgroundColor = [0.8,0.8,0.8];
/////

///////////
global zeta_chk
zeta_chk=uicontrol(mag2,"style","text");
zeta_chk.Units="normalized";
zeta_chk.Position = [0.8,0.6,0.15,0.08]//[lmargin topmargin width height];
zeta_chk.String = " ! ";
zeta_chk.Value = 0;
zeta_chk.Backgroundcolor = [0.8,0.8,0.8];
/////
global wn_chk
wn_chk=uicontrol(mag2,"style","text");
wn_chk.Units="normalized";
wn_chk.Position = [0.8,0.5,0.15,0.08]//[lmargin topmargin width height];
wn_chk.String = " ! ";
wn_chk.Value = 0;
wn_chk.Backgroundcolor = [0.8,0.8,0.8];
////////
global tr_chk
tr_chk=uicontrol(mag2,"style","text");
tr_chk.Units="normalized";
tr_chk.Position = [0.8,0.4,0.15,0.08]//[lmargin topmargin width height];
tr_chk.String = " ! ";
tr_chk.Value = 0;
tr_chk.Backgroundcolor = [0.8,0.8,0.8];
///////
global ts_chk
ts_chk=uicontrol(mag2,"style","text");
ts_chk.Units="normalized";
ts_chk.Position = [0.8,0.3,0.15,0.08]//[lmargin topmargin width height];
ts_chk.String = " ! ";
ts_chk.Value = 0;
ts_chk.Backgroundcolor = [0.8,0.8,0.8];
///////
global mp_chk
mp_chk=uicontrol(mag2,"style","text");
mp_chk.Units="normalized";
mp_chk.Position = [0.8,0.2,0.15,0.08]//[lmargin topmargin width height];
mp_chk.String = " ! ";
mp_chk.Value = 0;
mp_chk.Backgroundcolor = [0.8,0.8,0.8];

/////////
global tf
tf=uicontrol(mag2,"style","text");
tf.Units="normalized";
tf.Position = [0.01,0.07,0.5,0.1]//[lmargin topmargin width height];
tf.String = "Transfer Function:";
tf.Value = 0;
tf.Backgroundcolor = [0.8,0.8,0.8];


/////////
global line
line=uicontrol(mag2,"style","text");
line.Units="normalized";
line.Position = [0.2,0.07,0.5,0.1]//[lmargin topmargin width height];
line.String = "-------------------------------";
line.Value = 0;
line.Backgroundcolor = [0.8,0.8,0.8];
/////////

///////
global tf_num
tf_num=uicontrol(mag2,"style","text");
tf_num.Units="normalized";
tf_num.Position = [0.24,0.12,0.5,0.08]//[lmargin topmargin width height];
tf_num.String = " ";
tf_num.Value = 0;
tf_num.Backgroundcolor = [0.8,0.8,0.8];

//////


global tf_den
tf_den=uicontrol(mag2,"style","text");
tf_den.Units="normalized";
tf_den.Position = [0.21,0.04,0.5,0.08]//[lmargin topmargin width height];
tf_den.String = " ";
tf_den.Value = 0;
tf_den.Backgroundcolor = [0.8,0.8,0.8];

//////////////////////
a_old=0; b_old=0; m_old=0; c_old=0; y0_old=0;
function [DC, wn, zeta, tr, ts, mp]=maglev2(a,b,m,c,y0)
    disp("inside maglev2")
    
    global a_old b_old m_old c_old y0_old h sys
    N=4;
    u0=1.187*a*(y0+b)^N;

    s=%s;
    r=(N*u0)/(a*(y0+b)^(N+1));
    num=1/(a*(y0+b)^N);
    den=m*s^2+c*s+r;
    
    DC=num/m
    den=den/m;
    
    cf=coeff(den);
    wn=sqrt(cf(1))
    zeta = cf(2)/(2*wn)
    
    //////
    tr=(%pi-atan(sqrt(1-zeta^2)/zeta))/(wn*sqrt(1-zeta^2));
    
    ts=4/(zeta*wn);
    
    mp=(exp(-%pi*zeta/sqrt(1-zeta^2)))*100;
    t=0:0.1:200;

    sys=syslin('c',num,den);
    y=csim('step',t,sys);
    //clear t sys
    if ((a-a_old)~=0)|((b-b_old)~=0)|((c-c_old)~=0)|((m-m_old)~=0)|((y0-y0_old)~=0)
        try(clf(h))
        catch "";
        end
        
        plot2d(y)
        h=gcf();
    end
    a_old = a;
    b_old = b;
    m_old = m;
    c_old = c;
    y0_old = y0;
endfunction
//////////////////

function check()
    disp("inside check")
    global value_a value_b value_m value_c value_y0 DC_chk wn_chk zeta_chk tr_chk ts_chk mp_chk sys tf_num tf_den DC wn zeta tr ts mp
    disp(value_a)
    [DC, wn, zeta, tr, ts, mp]=maglev2(value_a.value,value_b.value,value_m.value,value_c.value,value_y0.value)
    tf_num.String = sci2exp(sys.num);
    tf_den.String = sci2exp(sys.den);
    if abs((strtod(value_DC1.string)-DC))<0.0001
        DC_chk.String = "Correct";
    else
        DC_chk.String = "Incorrect";
    end
    
    if abs((strtod(value_zeta.string)-zeta))<0.0001
        zeta_chk.String = "Correct";
    else
        zeta_chk.String = "Incorrect";
    end
    
    if abs((strtod(value_wn.string)-wn))<0.0001
        wn_chk.String = "Correct";
    else
        wn_chk.String = "Incorrect";
    end
    
    if abs((strtod(value_tr.string)-tr))<0.0001
        tr_chk.String = "Correct";
    else
        tr_chk.String = "Incorrect";
    end
    
    if abs((strtod(value_ts.string)-ts))<0.0001
        ts_chk.String = "Correct";
    else
        ts_chk.String = "Incorrect";
    end
    
    if abs((strtod(value_mp.string)-mp))<0.0001
        mp_chk.String = "Correct";
    else
        mp_chk.String = "Incorrect";
    end
    
endfunction
////
check_all=uicontrol(mag2,"style","pushbutton");
check_all.Units="normalized";
check_all.Position = [0.67,0.11,0.2,0.06]//[lmargin topmargin width height];
check_all.String = "Check All";
check_all.Callback = "check";
check_all.Relief="raised";
check_all.BackgroundColor = [0.8,0.8,0.8];
////////////

function show()
    global DC_chk zeta_chk wn_chk ts_chk tr_chk mp_chk DC wn zeta tr ts mp
    disp(DC)
    DC_chk.String = string(DC);
    zeta_chk.String = string(zeta);
    wn_chk.String = string(wn);
    tr_chk.String = string(tr);
    ts_chk.String = string(ts);
    mp_chk.String = string(mp);
endfunction
////
answers=uicontrol(mag2,"style","pushbutton");
answers.Units="normalized";
answers.Position = [0.67,0.03,0.2,0.06]//[lmargin topmargin width height];
answers.String = "Show Answers";
answers.Callback = "show";
answers.Relief="raised";
answers.BackgroundColor = [0.8,0.8,0.8];

