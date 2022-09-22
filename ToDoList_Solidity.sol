// SPDX-License-Identifier: MIT

//Hands on Task 2: To Do List

pragma solidity 0.8.13; // solidity version is declared.

contract ToDoApp { // contract creation.
    struct Todo {
        string toDoContent; // this attribute is created to store the content of the every "to do".
        bool isCompleted; // this is a boolean to check if a task is completed or not.
    }


    Todo[] public allTasks; // Todo[] is an array of to-do tasks.


    // function where we can create new tasks.
    function create(string calldata _text) public {
        
        Todo memory task; // a new todo with type Todo is created
        task.toDoContent = _text; // default isCompleted value is false already.

        allTasks.push(task); // the new Todo element is added to the array of Todos.
    }

    // basic getter function.
    function getTask(uint _index) public view returns (string memory toDoContent, bool isCompleted) { 
        Todo storage todo = allTasks[_index];
        return (todo.toDoContent, todo.isCompleted); //returns the attributes of a task.
    }

    // function that updates text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = allTasks[_index]; //select a task
        todo.toDoContent = _text; // assign new content to the selected task.
    }

    // toggles if completed or not.
    function toggleCompleted(uint _index) public {
        Todo storage todo = allTasks[_index];
        todo.isCompleted = !todo.isCompleted; // switches the value of "isCompleted".
    }
}
