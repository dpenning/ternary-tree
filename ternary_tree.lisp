; David Pennington & Nick Graczyk
; April 23 2014
; This program holds our ternary tree function.

; this gives us an empty ternary tree
(defun create_empty_ternary_tree () nil)

; this is the insert function. It is named fixed insert because it outputs in the correct format
; it uses the standard recursive insert for trees
(defun fixed_insert (value tern_tree)

	; if the tree is null
	(if (null tern_tree)

		; just return the value in list form
		(list value )

		; else check the size of the list
		(if ( = 1 (list-length tern_tree))

			; if the length is 1 
			; a = value in the tree
			(let ((a (pop tern_tree))) 

				;return the node with the lower value first
				(if ( > value a)
					(list a value)
					(list value a)))

			; if the length is greate than 1
			(if ( = 2 (list-length tern_tree))

				; if the length is 2
				; a = tern_tree value 1
				; b = tern_tree value 1
				(let ((a (pop tern_tree)))
					(let ((b (pop tern_tree)))

						;return a tree node at the correct location
						(if ( <= value a )
							(list (list value) a nil b nil)
							(if ( <= value b )
								(list nil a (list value) b nil)
								(list nil a nil b (list value))))))

				; if the length is greater than 2 it is a tree node
				; and can be handled as such, I make some variables here
				; to make it easier to deal with
				(let* ( (low_node (pop tern_tree)) 
						(low_val (pop tern_tree)) 
						(mid_node (pop tern_tree)) 
						(upr_val (pop tern_tree)) 
						(upr_node (pop tern_tree)))

					;recursively insert into the correct node of the tree
					(if ( <= value low_val )
						(list (fixed_insert value low_node) low_val mid_node upr_val upr_node)
						(if ( <= value upr_val )
							(list low_node low_val (fixed_insert value mid_node) upr_val upr_node)
							(list low_node low_val mid_node upr_val (fixed_insert value upr_node)))))))))

; this function takes a list and operate on it like a stack inserting until the list is empty
(defun insert_all_values_into_tern_tree (values tern_tree)

	; check if we are finished inserting
	(if (null values)

		;return the tree if we are
		tern_tree
		
		; get the list of values
		(let ((a values))

			; pop off of the values list
			(let ((b (pop a)))

				; insert the popped value into the tree
				(let ((c (fixed_insert b tern_tree)))

					;recursively insert the rest of the values
					(insert_all_values_into_tern_tree a c))))))

; this runs the recursive insert on the input and prints the output
(PRINT (insert_all_values_into_tern_tree (read) (create_empty_ternary_tree)))