# TeamGenie

TeamGenie is a web application for managing recreational sports teams and players.  Team captains start by inviting players (current app users or new invitees) to join their team.  Automated RSVP email requests are sent to the team players for each game, allowing the team captain to capture an accurate head count and determine substitute needs.  Additionally, captains can send custom emails to their players, collect league fee payments, and track historical attendance for team players.

Team players can use TeamGenie to check the season's schedule, RSVP to individual games, pay team dues, and communicate with other team members and captain via in-app emails.

### Motivation

TeamGenie is as a personal project by Ricardo Fleury and was conceived originally as a final project for DevBootcamp, a coding intensive program.  After completing DevBootcamp with a prototype of TeamGenie as a final project with my teammates [David Vaynshteyn](https://github.com/dvayns2) and [Kay Cubria](https://github.com/kaycubria) (see our [final presentation to employers](https://youtu.be/uaiQ1ACiSJA?t=20m30s)), I concluded that TeamGenie as a product held enough promise to be rebuilt thoughtfully as a learning project.   

### Learning Objectives

* Design code with object oriented principles and best practices in mind
* Abstract and loosely couple code to ensure scalability
* Build an application with a Rails API and a front end framework (AngularJS)
* Use third-party tools to properly deploy and track errors (refer to 'Testing' section)

## Technical Information

#### Feature Implementation

#### Testing 

##### Philosophy and Trade-offs

I believe that extensively testing an application is the best way to ensure that future changes do not break current functionality and keep the application running without any surprises.  However, there are trade-offs associated with a full testing suite - namely, the time (expense) it takes to build such a comprehensive suite.  

I aimed to provide a thorough test suite, but made trade-offs where I saw fit in order to best utilize my limited time to complete this project.  I focused very heavily on controller testing in order to ensure the core actions were performed upon calling any route and model testing to ensure validations, associations, and other core data model concerns were very tightly monitored.  I was less thorough with support functions (helpers, modules, etc) as a calculated trade-off with development speed.

##### Specs

I used RSpec for unit testing.  Currently, there are no feature specs, though I plan on implementing tests with Capybara in order to test the "happy path" functionality.

##### Continuous Integration

Every commit to every branch of the TeamGenie repository goes through a battery of testing in a continuous integration (CI) server.  I used CodeShip as TeamGenie's CI solution.  I chose CodeShip based on its ease of use and cost (free!).

##### Exception Handling

TeamGenie uses Rollbar to monitor exceptions.  I chose Rollbar because it's fairly easy to use and has an extensive free tier.

### Future Considerations (wish list)

* Add non-team players (substitutes) that can be called up for an individual game
* Stat tracking for players
* Text messaging (not implemented because of Twilio cost)
