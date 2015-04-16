/*
  Generic rule syntax for the rule based system

  $condition_list ==> $actions_list

  If all the condition in $condition_list
  are true, then execute all actions in $actions_list
*/
:- op(100, xfy, '==>').

/*
  Rules defintion
*/
[gay(X), pro(X)] ==> [assertz(progay(X))].
[linuxUser(X), pro(X)] ==> [assertz(god(X))].

/*
  Some facts
*/
linuxUser(ale).
gay(sergio).
pro(sergio).
pro(ale).

/*
  Execute a list of actions
*/
execute([]).
execute([[A|_]|L]) :-
	call(A),
	execute(L).

/*
  Checks if all the conditions in the list
  are satisfied
*/
evaluate_list([]).
evaluate_list([C|L]) :-
	clause(C, true),
	evaluate_list(L).

rac :-
	/* recognize */
	bagof(A, (C ==> A, evaluate_list(C)), Actions),
	/* act */
	execute(Actions).
