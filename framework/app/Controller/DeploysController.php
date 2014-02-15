<?php
class PostsController extends AppController {
    public $helpers = array('Html', 'Form');

    public function index() {
    		/**
	 * GIT DEPLOYMENT SCRIPT
	 *
	 * Used for automatically deploying websites via github or bitbucket
	 *
	 */
 
	// The commands
	$commands = array(
		'cd /home/alexandre/Documents/materialDB',
		'echo $PWD',
		'whoami',
		'git pull',
		'git status',
		'git submodule sync',
		'git submodule update',
		'git submodule status',
	);
 
	// Run the commands for output
	$output = '';
		foreach($commands AS $command){
			// Run it
			$tmp = shell_exec($command);
			// Output
			$output .= "<span style=\"color: #6BE234;\">\$</span> <span style=\"color: #729FCF;\">{$command}\n</span>";
			$output .= htmlentities(trim($tmp)) . "\n";
		}
    }
}
