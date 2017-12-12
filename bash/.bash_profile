 
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
screenfetch

# Meta Alias
alias subl="open -a sublime\ text"
alias v="vim"
alias prof="vim ~/.bash_profile"
alias idle="open -a idle"
alias reprof=". ~/.bash_profile"

function ll {
	cd ~/Documents/Personal\ Projects/programming_Language_learning/
}

function csci1933 {
	cd ~/Documents/Summer\ 2016/CSCI\ 1933\ Intro\ to\ alg\ and\ data\ struc/
}
# Brew Install
function brewInstall {
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
}


# Quick Jump to directories
function abasfarah {
	cd ~/Documents/Personal\ Projects/abasfarah.com/
}

function coderByte {
	cd ~/Documents/Coding_Challanges/CoderByte/
}

# Git functions
function gs {
	git status
}

function gc {
	git commit
}

function ga {
	git add
}

function gp {
	git push
}

function gl {
	git log
}
