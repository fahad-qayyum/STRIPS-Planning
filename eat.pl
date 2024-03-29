% Action definitions for "eat" planning scenario

can(open(X),[cl(X),closed(X)]):-appliance(X).
add(open(X),[opened(X)]).
del(open(X),[closed(X)]).

can(close(X),[cl(X),opened(X)]):-appliance(X).
add(close(X),[closed(X)]).  
del(close(X),[opened(X)]).  

can(take(X,From),[cl(From),opened(From),in(X,From)]):-appliance(From).
add(take(X,From),[has(X)]).  
del(take(X,From),[in(X,From)]).

can(putIn(C,In),[opened(In),cl(In),has(C)]):-appliance(In).
add(putIn(C,In),[in(C,In)]).  
del(putIn(C,In),[has(C)]).

can(bake(X),[cl(mo),in(X,mo),closed(mo)]):- food(X).
add(bake(X),[baked(X)]).  
del(bake(X),[]).

can(eat(X),[has(X),baked(X)]).
add(eat(X),[not_hungry]).  
del(eat(X),[has(X)]). 

can(move(To),[cl(X)]):-appliance(To).
add(move(To),[cl(To)]).  
del(move(To),[cl(X)]). 

appliance(mo).
appliance(ref).
food(chicken).
food(pizza).
