/*  Lab assignment 1b -- Part 1 (8 points)

% Leon Wetzel
% s3284174
% Computational Grammar - lab1

Subject-Verb (Aux) agreement, Singular and Plural nouns 

1. Read section 12.3.4 of J&M 

2. Implement their examples of subject (auxiliary) verb agreement as a DCG 

>> SEE GRAMMAR BELOW!
>> Using 3sg or 3,sg caused SWI-Prolog not to properly compile the code for strange reasons, that is why I used plu.

Instead of using atomic category symbols like pluAux use predicates with one or more arguments: aux(3sg) or aux(3,sg), etc.  
Make sure the number of arguments per predicate (category) is consistent. Use anonymous variables if needed.

You may assume that all words are in lower case. You do not have to add interpunction (periods, question marks).

Example sentences

do all flights offer dinner
does this flight stop in dallas
do passengers get dinner

what flights leave in the morning
what flight leaves from pittsburg

* does these flights offer dinner
* what flight leave from pittsburg

Make sure your grammar accepts all the grammatical examples, and none of the ungrammatical examples.

The rules for the VP and PP are given, but note that you may need to modify them if you add extra arguments to VP and/or NP.

Note that, if you do it right, the DCG effectively implements the solution that J&M hint at at the end 
of this section: it uses structured terms (feature structurese as they say) and unification
to avoid proliferation of the number of rules.

3. Add at least 10 new lexical rules (i.e. rules with a word/terminal as right-hand side), according to the following rule:

If your student number ends with digit N add only rules for words that start with Letter:

N Letter
0  b
1  d
2  g
3  k
4  l
5  m
6  n
7  p
8  r
9  s
10 t


So if your number is 123456, you could add the words nerd, nerds, needs, night, etc.

>> SEE GRAMMAR BELOW!

4. Add 5 new example sentences (using the sentence/2 predicate) that can be parsed with your grammar and that use the new words you added. Note that 
there is no requirement that the sentences are semantically plausible, they only need to be grammatical. 

>> SEE GRAMMAR BELOW!

You can use the test/0 predicate to test whether all sentences can be parsed, and to test whether none of the ungrammatical sentences are parsed.

?- test.
parsing sentence 1...
parsing sentence 1 ok !!!
parsing sentence 1 ok !!!
parsing sentence 2...
parsing sentence 3...
parsing sentence 4...
parsing sentence 5...
parsing ungrammatical sentence 1...
parsing ungrammatical sentence 2...
true.

Sentences 2-5 could not be parsed, ungrammatical cases 1 and 2 could not be parsed, and for sentence 1 there are actually 2 derivations (prolog proofs).
In general, multiple derivations should be avoided.
You can do a trace on test or parse the specific example that gives rise to multiple derivations to try to understand what is going on.
If you don't see the problem, hand in the grammar as is (multiple derivations are better than no derivations for grammatical sentences).

*/

% examples: add more if you want 

% OCD satisfaction right here!
verb(sg) --> [loses].
verb(plu) --> [lose].
verb(sg) --> [lacks].
verb(plu) --> [lack].
verb(sg) --> [lurks].
verb(plu) --> [lurk].
verb(sg) --> [looks].
verb(plu) --> [look].

n(sg) --> [loser].
n(plu) --> [losers].
n(sg) --> [lollypop].
n(plu) --> [lollypops].
n(sg) --> [lexicon].
n(plu) --> [lexicons].
n(sg) --> [lullaby].

sentence(1,[do,all,flights,offer,dinner]).
sentence(2,[does,this,flight,stop,in,dallas]).
sentence(3,[do,all,passengers,get,dinner]).
sentence(4,[what,flights,leave,in,the,morning]).
sentence(5,[what,flight,leaves,from,pittsburg]).
sentence(6,[do,losers,lurk,the,passengers]).
sentence(7,[does,the,loser,lose,the,lexicon]).
sentence(8,[what,lullaby,lurks,in,the,lollypop]).
sentence(9,[do,all,losers,lack,lexicons]).
sentence(10,[what,lollypops,look,in,losers]).
ungrammatical(1,[does,all,flights,offer,dinner]).
ungrammatical(2,[what,flight,leave,from,pittsburg]).

% grammar: add lexical entries, add and modify rules. 

whd(_) --> [what].

aux(plu) --> [do].
aux(sg) --> [does].

prep(plu) --> [all].
prep(_) --> [in].

n(plu) --> [flights].
n(sg) --> [flight].
n(sg) --> [dinner].
n(sg) --> [morning].
n(plu) --> [passengers].

nnp(sg) --> [pittsburg].
nnp(sg) --> [dallas].

det(_) --> [the].
det(sg) --> [this].
det(plu) --> [these].

verb(plu) --> [offer].
verb(plu) --> [stop].
verb(plu) --> [get].
verb(sg) --> [leaves].
verb(plu) --> [leave].

s --> whd(_), n(Num), vp(Num).
s --> aux(Num), np(Num), vp(plu).
s --> np(Num), vp(Num).

vp(Num) --> verb(Num).
vp(Num) --> verb(Num), np(Num).

np(Num) --> det(Num), n(Num).
np(Num) --> nnp(Num).
np(Num) --> n(Num).

pp(Num) --> prep(Num), np(Num).

/* Question 2 (2points) (Bonus)

Implement the distinction between subject and non-subject pronouns.

Note that English distinguishes between subject pronouns and non-subject (object) pronouns:

I leave in the morning
do we get dinner
the pilot leaves me
* the pilot leaves 

1. Extend the grammar with an extra argument that captures this distinction, and add rules that allow NPs to rewrite as pronouns, 
and add lexical rules for 1st, 2nd, and 3rd person singular and plural pronouns.

2. Add some examples of sentences that your grammar accepts.

*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  you should not change anything  to the code below %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test :-
    test_sentence,
    test_ungrammatical.

test_sentence :-
    (  sentence(X,Sentence),
       format(user_error,"parsing sentence ~w: ~w~n",[X,Sentence]),
       s(Sentence,[]),
       format(user_error,"parsing sentence ~w ok !!!~n",[X]),
       fail
    ;  true
    ).

test_ungrammatical :-
    (  ungrammatical(X,Sentence),
       format(user_error,"parsing ungrammatical sentence ~w:~w~n",[X,Sentence]),
       s(Sentence,[]),
       format(user_error,"parsing ungrammatical sentence ~w ok ??? ~n",[X]),
       fail
    ;  true
    ).

