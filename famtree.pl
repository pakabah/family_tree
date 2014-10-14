male(paul).
male(john).
male(ray).
male(daniel).
male(dave).
male(eric).
male(robert).
male(gordon).
male(stallin).
male(peter).
male(wisdom).
male(max).
male(steven).
male(miriam).
male(lewisJnr).
male(lewis).

female(vera).
female(miriam).
female(justine).
female(georgina).
female(mavis).
female(jessy).
female(selasi).
female(josphine).
female(mildred).
female(grace).
female(henritta).
female(natasha).
female(naureen).
female(maureen).
female(ester).

parent(john,paul).
parent(john,daniel).
parent(john,dave).
parent(john,steven).
parent(john,vera).

parent(mavis,paul).
parent(mavis,daniel).
parent(mavis,dave).
parent(mavis,steven).
parent(mavis,vera).

parent(robert,wisdom).
parent(robert,georgina).
parent(robert,peter).

parent(natasha,wisdom).
parent(natasha,georgina).
parent(natasha,peter).

parent(steven,mildred).
parent(josphine,mildred).

parent(ray,john).
parent(ray,miriam).
parent(ray,robert).
parent(ray,eric).
parent(ray,selasi).
parent(ray,gordon).

parent(justine,john).
parent(justine,miriam).
parent(justine,robert).
parent(justine,eric).
parent(justine,selasi).
parent(justine,gordon).

parent(max,ray).
parent(max,grace).
parent(jessy,ray).
parent(jessy,grace).

parent(miriam,areil).
parent(stallin,areil).

parent(lewis,naureen).
parent(lewis,maureen).
parent(lewis,miriam).
parent(lewis,lewisJnr).

parent(ester,naureen).
parent(ester,maureen).
parent(ester,miriam).
parent(ester,lewisJnr).

parent(nampar,mavis).
parent(nampar,lewis).

parent(maabi,mavis).
parent(maabi,lewis).

husband(max,jessy).
husband(stallin,miriam).
husband(john,mavis).
husband(robert,natasha).
husband(ray,justine).
husband(steven,josphine).

husband(lewis,ester).

wife(jessy,max).
wife(miriam,stallin).
wife(mavis,john).
wife(natasha,robert).
wife(justine,ray).
wife(josphine,steven).
wife(ester,lewis).

married(X,Y):-husband(X,Y).
married(X,Y):-wife(X,Y).


father(X,Y):-parent(X,Y),male(X).

mother(X,Y):-husband(Z,X),father(Z,Y),female(X).

brother(X,Y):-father(Z,X),father(Z,Y),X\=Y,male(X).


sister(X,Y):-father(Z,X),father(Z,Y),X\=Y,female(X).

siblings(X,Y):-parent(Z,X),parent(Z,Y).

son(X,Y):-father(Y,X),male(X).
son(X,Y):-mother(Y,X),male(X).

daughter(X,Y):-father(Y,X),female(X).
daughter(X,Y):-mother(Y,X),female(X).

grandparents(X,Y):-parent(X,Z),parent(Z,Y).

grandmother(X,Y):-parent(X,Z),parent(Z,Y),female(X).

grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).

greatgrandparents(X,Y):-grandparents(Z,Y),parent(X,Z).

greatgrandfather(X,Y):-grandparents(Z,Y),parent(X,Z),male(X).

greatgrandmother(X,Y):-grandparents(Z,Y),parent(X,Z),female(X).

uncle(X,Y):-brother(Z,X),parent(Z,Y),male(X).
uncle(X,Y):-married(X,Z),parent(W,Y),siblings(W,Z),male(X).

aunty(X,Y):-uncle(Z,Y),married(Z,X),female(X).
aunty(X,Y):-siblings(Z,X),sister(X,Z),father(Z,Y),female(X).

nephew(X,Y):-siblings(Z,Y),son(X,Z),male(X).

niece(X,Y):-siblings(Z,Y),daughter(X,Z),female(X).

cousin(X,Y):-parent(Z,X),parent(W,Y),siblings(Z,W),\+brother(X,Y),\+sister(X,Y),X\=Y.

brotherinlaw(X,Y):-married(X,Z),sister(Z,Y),male(X).

sisterinlaw(X,Y):-married(X,Z),brother(Z,Y),female(X).

motherinlaw(X,Y):-married(Y,Z),mother(X,Z),female(X).

fatherinlaw(X,Y):-married(Y,Z),father(X,Z),male(X).

soninlaw(X,Y):-married(X,Z),daughter(Z,Y),male(X).

daughterilaw(X,Y):-married(X,Z),son(Z,Y),female(X).



