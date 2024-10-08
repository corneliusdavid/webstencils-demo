# WebStencils Demo #

Delphi 12.2 introduced WebStencils, a script-based way to process text similar to the ASP.NET Razor technology. Its primary use is to generate dynamic HTML from a WebBroker server application but can be used in other ways to generate XML, JSON, or any type of textual output from a template.

This repository contains a couple of very simple Delphi 12.2 WebBroker applications (run as Windows VCL programs which launch a web browser) to compare templates made with the HTML-style tags used in `TPageProducer` components, with the new "@" symbol tags used in the new `TWebStencilsProcessor` components. All the project and HTML files are in one folder and the two projects share a data module for accessing the [Chinook SQLite database](https://www.sqlitetutorial.net/sqlite-sample-database) (not included).

There are five pages in each application, made to look identical so you can concentrate on the template technology:

1. Index (presents a login page)
2. Login Error 
3. Customer List (lists customers in a table)
4. Customer Edit (presents an edit page for the selected customer)
5. An error page (for preventing unauthorized access)

The HTML files referenced by the two projects are named to make it clear which project/technology they work with:

**Traditional PageProducer template HTML files:**

- `index-wbroker.html` 
- `loginfailed-wbroker.html`
- `custlist-wbroker.html`
- `custedit-wbroker.html`
- `accessdenied-wbroker.html`

**New WebStencils template HTML files:**

- `index-wStencils.html`
- `login-failed-wStencils.html`
- `custlist-wStencils.html`
- `custedit-wStencils.html`
- `accessdenied-wStencils.html`
- `custlistframework1.html`

Notice there's one more file in the WebStencils collection, it's a framework template for each web page generated from the WebStencils actions and is combined from the header and footer strings embedded in the page producers used in the traditional WebBroker project.

## Building the Projects 

Before you try to compile or run, you should download the [Chinook sample database](https://github.com/lerocha/chinook-database). This is a popular database used for tutorials and demos and can be found in many different places. I use [DBeaver](https://dbeaver.io/), a free database tool, and found it ships with that.

Once you have the `chinook.db` in the same folder as the project, you need to open the data module (used by both projects), **`udmCust`**, and modify the `TFDConnection` component to specify the location of the database file. I would also suggest using a database tool or Delphi's [Data Explorer](https://docwiki.embarcadero.com/RADStudio/Athens/en/Data_Explorer) to view the tables in the database. 

Delphi 12.2 was used to create and test these programs (which use no third-party components).

## Running the demos

Both demos are created as Web Server Windows GUI programs, meaning they run as a  small Windows VCL program that opens a port to listen for web requests with a button to launch your default web browser. The PageProducer version listens on port 8081 and the WebStencils version listens on port 8082 so you can run both simultaneously if you'd like.

The first page listed is a login page. A valid login must be entered before it will take you to the customer list. A valid login is any user in the Employees table where:

- **Username** is the `FirstName`, case-insensitive;
- **Password** is a concatenation of the `EmployeeId` and the `LastName`, case-*sensitive*.

For example, the first entry in the sample database I downloaded had the following first employee:

- `ID`: 1
- `FirstName`: Andrew
- `LastName`: Adams

Therefore, to login with this employee:

- Username: `ANDREW` (upper or lower or mixed case)
- Password: `1Adams` (exactly)

Once logged in, the customer list is shown. Each customer's ID (left-most column) is a link that takes you to an "edit" screen that lists all the customer fields in edit boxes. The Submit button does not save changes or do anything other than take you back to the list of customers.

### Table Names

I've used two different "Chinook" sample databases, one had singular table names (e.g. "Customer" and "Employee") while the other had plural (e.g. "Customer**s**" and "Employee**s**"); if the one you get is different than the one in this repository, just change the table names and queries to match.

### Why HTML Tables?

The customer list is built using the old HTML table tags (`<table>`, `<tr>`, `<td>`, etc.) because that's the simple and default way that the old WebBroker server apps built using the `TDataSetTableProducer` components were done. The new WebStencils version builds the same HTML result so you can compare how it's done and the resulting web pages will be nearly identical. Modern websites typically construct CSS-style tables, a benefit that can be realized by switching from DataSetTableProducers to WebStencils.

## Blog

Read my ["Introducing WebStencils"](https://corneliusconcepts.tech/introducing-webstencils) blog to learn more about the technology behind these programs and why WebStencils is cool!

