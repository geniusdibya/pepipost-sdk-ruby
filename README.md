![pepipostlogo](https://pepipost.com/assets/img/pepipost-footLogo.png)

[![Twitter Follow](https://img.shields.io/twitter/follow/pepi_post.svg?style=social&label=Follow)](https://twitter.com/pepi_post)

# Official Ruby Gem :gem: for [Pepipost](http://www.pepipost.com/?utm_campaign=GitHubSDK&utm_medium=GithubSDK&utm_source=GithubSDK)

This gem contain methods for easily interacting with the Pepipost Email Sending API to send emails within few seconds.

We are trying to make our libraries a Community Driven. To help us building right things in proper order we would request you to help us by sharing comments, creating new issues or pull request.

## Table of Content
* [Installation](#installation)
* [Quick Start](#quickstart)
* [Sample Example](#steps)
* [Announcements](#announcements)
* [Roadmap](#roadmap)
* [About](#about)
* [License](#license)


<a name="installation"></a>
## Installation 
   
There are two ways of installing this Pepipost gem. You can use either of the below: 

``` gem install pepipost_gem``` 

Once pepipost_gem is installed, use the sample example to [send test email](#steps). 

**OR**

### Manually generate you own pepipost gem 

This client library is a Ruby gem which can be compiled and used in your Ruby and Ruby on Rails project. This library requires a few gems from the RubyGems repository

* Open the command line interface/terminal and navigate to the folder of your choice and run the below commands.
* ``` git clone https://github.com/pepipost/pepipost-sdk-ruby.git && cd pepipost-sdk-ruby ``` to download and navigate to downloaded folder
* ``` gem build build pepipost_gem.gemspec ``` to build the gem.
* ``` gem install pepipost_gem-2.5.0.gem ``` to install pepipost gem

![Building Gem](https://apidocs.io/illustration/ruby?step=buildSDK&workspaceFolder=pepipost_gem-Ruby&workspaceName=pepipost_gem-Ruby&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

<a name="quickstart"></a>
## Quickstart

The following section explains how to use the PepipostGem Ruby Gem in a new Rails project using RubyMine&trade;.

The basic workflow presented here is also applicable if you prefer using a different editor or IDE.

1. Starting a new project

   Close any existing projects in RubyMine&trade; by selecting 

   * ``` File -> Close Project ```. 
   * Next, click on ``` Create New Project ``` to create a new project from scratch.

   ![Create a new project in RubyMine](https://apidocs.io/illustration/ruby?step=createNewProject0&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

   * Next, provide ``` TestApp ``` as the project name.
   * Choose ``` Rails Application ``` as the project type.
   * Click ``` OK ```.

   ![Create a new Rails Application in RubyMine - step 1](https://apidocs.io/illustration/ruby?step=createNewProject1&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

     In the next dialog make sure that correct *Ruby SDK* is being used (minimum 2.0.0) 
   * click ``` OK ```.

   ![Create a new Rails Application in RubyMine - step 2](https://apidocs.io/illustration/ruby?step=createNewProject2&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

   This will create a new Rails Application project with an existing set of files and folder.

2. Add reference of the gem
   
   * In order to use the Pepipost gem in the new project, add a gem reference.
   * Locate the ```Gemfile``` in the *Project Explorer* window under the ``` TestApp ``` project node.
   * The file contains references to all gems being used in the project. Here, add the reference to the library gem by adding the following line:
    ``` gem 'pepipost_gem', '~> 2.5.0' ```

   ![Add references of the Gemfile](https://apidocs.io/illustration/ruby?step=addReference&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

3. Adding a new Rails Controller

   * Once the ``` TestApp ``` project is created.
   * Folder named ``` controllers ``` will be visible in the *Project Explorer* under the following path:
     ``` TestApp > app > controllers ```. 
   * Right click on this folder.
   * select ``` New -> Run Rails Generator... ```.

   ![Run Rails Generator on Controllers Folder](https://apidocs.io/illustration/ruby?step=addCode0&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

   * Selecting the said option will popup a small window where the generator names are displayed.
   * select the ``` controller ``` template.

   ![Create a new Controller](https://apidocs.io/illustration/ruby?step=addCode1&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

   * A  popup window will ask you for a Controller name and included Actions.
   * For controller name provide ``` Hello ```.
   * Include an action named ``` Index ```. 
   * Click ``` OK ```.

   ![Add a new Controller](https://apidocs.io/illustration/ruby?step=addCode2&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

   * A new controller class anmed ``` HelloController ``` will be created in a file named ``` hello_controller.rb ``` containing a method named ``` Index ```.
   * In this method, copy [sample example](#steps).
   * Run your project.

   ![Initialize the library](https://apidocs.io/illustration/ruby?step=addCode3&workspaceFolder=pepipost_gem-Ruby&workspaceName=PepipostGem&projectName=pepipost_gem&gemName=pepipost_gem&gemVer=2.5.0)

<a href="steps"></a>
## Usage

```ruby
require 'pepipost_gem'
require 'json'
include PepipostGem

client = PepipostGemClient.new
email_controller = client.email
api_key = 'api-key-here'
body = EmailBody.new

body.personalizations = []
body.personalizations[0] = Personalizations.new
body.personalizations[0].recipient = 'your-rcpt-email@gmail.com'

body.tags = 'tags'
body.from = From.new
body.from.from_email = 'from-email-here@pepipost.com'
body.from.from_name = 'info'
body.subject = 'Check1'
body.content = 'test ruby'
body.settings = Settings.new

body.settings.footer = 0
body.settings.clicktrack = 1
body.settings.opentrack = 1
body.settings.unsubscribe = 1

begin
        result = email_controller.create_send_email(api_key, body)
        puts JSON.pretty_generate(result)
rescue APIException => ex
        puts "Caught APIException: #{ex.message}"
end
```

* Change your api-key and sending domain respectively
  * **apikey** will be available under Login to Pepipost -> Settings -> Integration  
  * **Sending Domain** will be available under Login to Pepiost -> Settings -> Sending Domains 
* Save above file as sendEmail.rb
* run ``` ruby sendEmail.rb ```

<a name="announcements"></a>
# Announcements

v2.5.0 has been released! Please see the [release notes](https://github.com/pepipost/pepipost-sdk-ruby/releases/) for details.

All updates to this library are documented in our [releases](https://github.com/pepipost/pepipost-sdk-ruby/releases). For any queries, feel free to reach out us at dx@pepipost.com

<a name="roadmap"></a>
## Roadmap

If you are interested in the future direction of this project, please take a look at our open [issues](https://github.com/pepipost/pepipost-sdk-ruby/issues) and [pull requests](https://github.com/pepipost/pepipost-sdk-ruby/pulls). We would love to hear your feedback.

<a name="about"></a>
## About
pepipost-sdk-ruby library is guided and supported by the [Pepipost Developer Experience Team](https://github.com/orgs/pepipost/teams/pepis/members) .
This pepipost gem is maintained and funded by Pepipost Ltd. The names and logos for pepipost gem are trademarks of Pepipost Ltd.

<a name="license"></a>
## License
This code library was semi-automatically generated by APIMATIC v2.0 and licensed under The MIT License (MIT). 


