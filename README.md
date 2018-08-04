# LaunchAtLoginApp

LaunchAtLoginApp is a Xcode sample project for launching a sandboxed OS X application at login. It works without modifications and is Mac App Store approved. 

For details on how the app works and what you have to keep in mind, please read my [blog post on this project](http://blog.timschroeder.net/2012/07/03/the-launch-at-login-sandbox-project/) and in addition my [blog post on how to detect if an app was launched during login under OS X 10.9 Mavericks](http://blog.timschroeder.net/2014/01/25/detecting-launch-at-login-revisited).

The most important prerequisites for the LaunchAtLoginApp to work are:

* sign the app with your Developer ID
* place it in the `/Applications` or `~/Applications` folder before enabling launch at login from within the app. 

## License

The license for this application is contained in the „license.md“ file.

## Support

For feature requests and bug reports, please use GitHub’s issue tracker. I’ll see what I can do.

## Changelog

### Version 1.1 (February 2014)

* LaunchAtLoginApp should really work with OS X 10.9 Mavericks
* Main app properly recognizes if it was launched at login
* Some minor code improvements