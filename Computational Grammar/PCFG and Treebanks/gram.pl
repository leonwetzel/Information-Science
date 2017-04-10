%% Grammar modified by Leon Wetzel
%% s3284174 - Computational Grammar

lex(de,det,0.3).
lex(het,det,0.3).
lex(ons,det,0.1).
lex(een,det,0.2).
lex(haar,det,0.1).

lex(man,n,0.1).
lex(mannen,n,0.05).
lex(baas,n,0.1).
lex(vrouw,n,0.1).
lex(vrouwen,n,0.05).
lex(hond,n,0.05).
lex(honden,n,0.05).
lex(huisdier,n,0.1).
lex(biefstuk,n,0.1).
lex(verrekijker,n,0.05).
lex(tegenstand,n,0.05).
lex(verjaardag,n,0.05).
lex(fortuin,n,0.05).
lex(tegenzin,n,0.05).
lex(mij,n,0.05).


lex(het,np,0.4).
lex(ons,np,0.2).
lex(mij,np,0.2).
lex(haar,np,0.2).

lex(ziet,v,0.3).
lex(blaft,v,0.1).
lex(geeft,v,0.3).
lex(betaalt,v,0.2).
lex(viert,v,0.05).
lex(vier,v,0.05).

lex(is,cop,0.4).
lex(lijkt,cop,0.3).
lex(werd,cop,0.3).

lex(aardige,a,0.25).
lex(bange,a,0.25).
lex(aardig,a,0.25).
lex(bang,a,0.25).

lex(twee,num,0.3).
lex(drie,num,0.3).
lex(vier,num,0.4).

lex(met,p,0.25).
lex(zonder,p,0.05).
lex(aan,p,0.2).
lex(van,p,0.3).
lex(voor,p,0.15).
lex(tegen,p,0.05).

lex(nooit,adv,0.33).
lex(niet,adv,0.33).
lex(vandaag,adv,0.34).

unknown_lex(_,n,0.5).
unknown_lex(_,v,0.3).
unknown_lex(_,a,0.2).

rule(s,[np,vp],0.35).
rule(s,[vp],0.19).  % gebiedende wijs
rule(s,[np,v],0.35).
rule(s,[v],0.11).  % gebiedende wijs

rule(np,[det,n(2)],0.1).
rule(np,[n(2)],0.1).
rule(np,[det,n(1)],0.2).
rule(np,[n(1)],0.1).
rule(np,[det,n],0.3).
rule(np,[n],0.2).

rule(vp,[vp,pp],0.3).
rule(vp,[vp,adv],0.2).
rule(vp,[vp,ap],0.2).
rule(vp,[vp,np],0.3).

rule(vp,[v,pp],0.3).
rule(vp,[v,adv],0.2).
rule(vp,[v,ap],0.2).
rule(vp,[v,np],0.3).

rule(vp,[cop,pp],0.2).
rule(vp,[cop,adv],0.2).
rule(vp,[cop,ap],0.3).
rule(vp,[cop,np],0.3).

rule(n(1),[n(1),pp],0.4).
rule(n(1),[n,pp],0.6).

rule(n(2),[num,n(2)],0.2).
rule(n(2),[num,n(1)],0.25).
rule(n(2),[num,n],0.55).

rule(n(2),[ap,n(2)],0.2).
rule(n(2),[ap,n(1)],0.25).
rule(n(2),[ap,n],0.55).

rule(n(2),[a(1),n(2)],0.2).
rule(n(2),[a(1),n(1)],0.3).
rule(n(2),[a(1),n],0.5).

rule(n(2),[a,n(2)],0.2).
rule(n(2),[a,n(1)],0.25).
rule(n(2),[a,n],0.55).

rule(ap,[pp,ap],0.1).
rule(ap,[pp,a(1)],0.1).
rule(ap,[pp,a],0.1).
rule(ap,[a(1),pp],0.1).
rule(ap,[a,pp],0.3).
rule(ap,[a],0.3).

rule(a(1),[a(1),pp],0.4).
rule(a(1),[a,pp],0.6).

rule(pp,[p,np],1).

sentence(1, [de,man,geeft,ons,fortuin,aan,de,hond]).
sentence(2, [de,man,ziet,de,vrouw,met,de,hond,met,de,verrekijker]).
sentence(3, [de,man,van,de,vrouw,van,de,man,van,de,vrouw,geeft,het,aan,de,hond,van,de,vrouw]).
sentence(4, [de,vrouw,is,bang,voor,de,hond]).
sentence(5, [de,voor,honden,bange,vrouw,ziet,de,aardige,man,met,de,verrekijker]).
sentence(6, [de,man,is,bang,voor,de,vrouw,met,de,hond]).
sentence(7, [de,man,geeft,de,hond,met,tegenzin,biefstuk]).
sentence(8, [de,man,geeft,de,biefstuk,aan,de,honden,met,tegenzin]).
sentence(9, [de,man,geeft,het,biefstuk]).
sentence(10, [de,man,geeft,ons,aardig,tegenstand,vandaag]).
sentence(11, [vier,de,verjaardag,zonder,tegenzin]).
sentence(12,[de,vrouw,is,vandaag,niet,aardig,tegen,de,man,met,de,hond]).
