class Task < ApplicationRecord
    has_many :subtasks
    has_closure_tree
end
