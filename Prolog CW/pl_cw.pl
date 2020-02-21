% Callum Forsyth, H00275277
% F28PL Coursework, Prolog    

% You may assume variables, procedures, and functions defined in earlier questions
% in your answers to later questions, though you should add comments in code explaining
% this if any clarification might help read your code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The complex numbers are explained here (and elsewhere):
%  http://www.mathsisfun.com/algebra/complex-number-multiply.html
% Represent a complex integer as a two-element list of integers, so [4,5] represents 4+5i.
% Write Prolog predicates
%  cadd/3
%  cmult/3
% representing complex integer addition and multiplication. Thus for instance,
%  cadd([X1,X2],[Y1,Y2],[Z1,Z2])
% succeeds if and only if Z1=X1+Y1 and Z2=X2+Y2.
% Note that complex number multiplication is not just like complex number addition.
% Check the link and read the definition.
%

%%%%%%%%%%%%%%%%%%%%% cadd %%%%%%%%%%%%%%%%%%%%% 

% Adding the first two values (X1 + Y1) and the second two values (X2 + Y2)
cadd([X1,X2],[Y1,Y2], [Z1,Z2]):-

% Asserting that Z1 is the sum of (X1 + Y1)
Z1 is X1 + Y1,
% Asserting that Z2 is the sum of (X2 + Y2)
Z2 is X2 + Y2.

% **** cadd TEST 1 (Run the command below in swipl) ****
% cadd([2,3],[3,4], [5,7]).

% **** cadd TEST 2 (Run the command below in swipl) ****
% cadd([3,5],[2,6], [Z1,Z2]). 
% Should return Z1 = 5 , Z2 = 11 

%%%%%%%%%%%%%%%%%%%%% cadd %%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% cmult %%%%%%%%%%%%%%%%%%%%%
% Using the foil method (ac-bd) + (ad + bc)i 
cmult([X1,X2],[Y1,Y2], [Z1,Z2]):-
% Asserting that Z1 is the sum of (X1*Y1 - X2*Y2)
Z1 is X1*Y1 - X2*Y2,
% Asserting that Z2 is the sum of (X1*Y2 + X2*Y1)
Z2 is X1*Y2 + X2*Y1.

% **** cmult TEST 1 (Run the command below in swipl) ****
% cmult([1,2],[3,4], [-5,10]).

% **** cmult TEST 2 (Run the command below in swipl) ****
% cmult([7,6],[4,3], [Z1,Z2]).
% Should return Z1 = 10 , Z2 = 45 

%%%%%%%%%%%%%%%%%%%%% cmult %%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% An integer sequence is a list of integers. Write a Prolog predicate
%  seqadd/3
% such that seqadd(X,Y,Z) succeeds when X and Y are lists of integers of the same length and
% Z is their sequence sum.
%

%%%%%%%%%%%%%%%%%%%%% seqadd %%%%%%%%%%%%%%%%%%%%%

% Creating the base case 
seqadd([],[],[]). 
% This adds the first two elements (the heads) together, then recursively adds the tails of the list
seqadd([HX|TX],[HY|TY], [HZ|TZ]):- 
seqadd(TX,TY,TZ), 
HZ is HX+HY.

% **** seqadd TEST 1 (Run the command below in swipl) ****
% seqadd([],[],[]).
% This is the base case test and should return true 

% **** seqadd TEST 2 (Run the command below in swipl) ****
% seqadd([1,2,3,4],[1,2,3,4],[2,4,6,8]). 
% seqadd on 4 elements. This should return true

% **** seqadd TEST 3 (Run the command below in swipl) ****
% seqadd([1,2,3,4,5,6,7,8,9,10],[10,9,8,7,6,5,4,3,2,1],[11,11,11,11,11,11,11,11,11,11]). 
% seqadd on 10 elements. This should return true 

%%%%%%%%%%%%%%%%%%%%% seqadd %%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3a. Explain what backtracking has to do with Prolog. You might find this webpage helpful:
% https://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/search.html
%
% Backing tracking in prolog is essentially a way of searching and getting multiple solutions 
%
% If we have the following database below, showing the different colours that callum likes. 
%
% likes(callum,red).
% likes(callum,blue).
% likes(callum,green).
%
% likes(callum,colour). If I give the query and ask prolog what are all the colours that callum likes it will answer
% colour = red   I can then ask again for the next item and prolog will answer
% colour = blue  If I ask again then prolog will answer 
% colour = green If I ask again prolog will answer no as there are no other colours that callum likes 
%
%
% 3b. What is Cut in prolog and what does it have to do with backtracking? Explain your answer by giving examples of Cut
% used in at least one prolog rule, and explain how it affects the execution/resolution process.
%
% The cut operator in prolog is written as '!' and is used to stop backtracking and unnecessary computations as backtracking can 
% waste time checking possibilites that lead to no where.
% This can be shown in the predicate below, max/3 succeeds if the third argument is the max of the first two 
% max(X,Y,Y):- X =< Y.
% max(X,Y,X):- X>Y.
%
% ?-max(2,3,3).
% yes  
% ?-max(7,3,7).
% yes
%
% If max is called with max(3,4,Y), it will unify Y with 4, but when asked for more solutions
% it will try to satisfy the second clause, this is inefficent. We then re-write using cut to solve this 
% max(X,Y,Y):- X=<Y,!.
% max(X,Y,X):- X>Y
% This has the following effect, if X=<Y suceeds, the cut commits to this choice, and the second clause isn't considered
% saving time and computing power, if X=<Y fails then second clause is considered.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Write a database for a predicate cycleoflife/1 such that the query
%  cycleoflife(X)
% returns the instantiations
%  X = eat
%  X = sleep
%  X = code
%  X = eat
%  X = sleep
%  X = code
%  ...
% in an endless cycle.

% Creating the variables to be displayed when called recursively 
cycleoflife(eat).
cycleoflife(sleep).
cycleoflife(code).

% Recursively calling cycleoflife(), cycling through the words each time we press 'n'
cycleoflife(I) :- 
    cycleoflife(I). 

% **** cycleoflife TEST 1 (Run the command below in swipl) ****
% cycleoflife(I). 
% Continue to press n for the next word 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
