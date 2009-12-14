Jesus
=====

Jesus is a web interface to [god](http://github.com/mojombo/god)
It allows you to see the process and monitor/unmonitor them.

[![Jesus Screenshot](http://cloud.github.com/downloads/dmathieu/jesus/jesus-0.0.1.thumb.png)](http://cloud.github.com/downloads/dmathieu/jesus/jesus-0.0.1.png)

Installation
------------

To install the application you first need to have [bundler](http://github.com/wycats/bundler) installed on your machine.
Once that is done, clone the project in the directory of your choice.

    git clone git://github.com/dmathieu/jesus.git

Or using the gem.

    gem install jesus --source http://gemcutter.org

Then you should install the dependencies.

    gem bundle

You now have Jesus available on your machine. Start your god process.
And start Jesus.

    god -c /path/to/your/god.config
    rackup

Note: Jesus and God should be started with the same user. Otherwise, Jesus won't be able to get access to the God informations.

Go to [localhost:9292](http://localhost:9292) to watch the process monitored by god.

Contributing
------------

If you think Jesus is great but can be improved, feel free to contribute.
To do so, you can :

* [Fork](http://help.github.com/forking/) the project
* Do your changes and commit them to your repository
* Test your changes. We won't accept any untested contributions (except if they're not testable).
* Create an [issue](http://help.github.com/forking/) with a link to your commits.

And that's it! We'll soon take a look at your issue and review your changes.

Author and Credits
------------------

Damien MATHIEU :: 42 (AT|CHEZ) dmathieu.com

The interface's design is freely inspired by [resque](http://github.com/defunkt/resque)'s web interface.