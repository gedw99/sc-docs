# sc-gio

This is the docs repo of the Open Science project.

WIP: Its very much a work in progress as we try approaches out. Contact me if your interested..
![](logo.png)

## Aims

- Reproducibility: GUI, Logic and Data all in one place, allowing Scienists to review each others work.

- Accessibility: Easy to use, and run locally in your Lab , with a Public Entry point to allow the public to participate.

- Secure: Accounts to control who can see and do what.

## Usage 

From an Editors perspective it's made up of:

- Editor and Renderer

- Logic 

- Data

### Editor

The GUI to allow you to edit the source via a WYSIWYG GUI that runs anywhere WASM runs such as Web, Desktop, Mobile.

Real time Collaboration: The IDL describing your GUI is synchronised with others usrs using OT ( Operational Transforms ). The Project on yor disk is the master, and your letting other edit your master. Other users reach you via QUIC Web Transport.

Non Real Time Collaboration: Each Proejct is saved to your disk disk and is a git repo, so that you can use git for non real time collaboration. 

Mutations: When you change a Widget or data binding in the Editor , we rewrite the IDL source and the Renderer redraws diffing and merging from the previosus frame render.  The history is saved via the OT tree.

Actors: A User that is using an App that you created in the Editor is the exact Runtoe and IDL code. So if they have edit rights, they can fork and edit the Project also. This is all done seamlessly for them.

### Renderer

All rendering is GPU accelerated for Online and Offline rendering.

OnLine Rendering: Its fast enough to do animations on most modern machines. 

Off Line rendering: For Video outout or massive lasrge PDF or Images, the Edit history is used as a Non Linear Editor, so that you can render at 4 K if needed. 

Render targets are: WASM ( Web, Mobile Desktop, TV ), PDF, PNG, SVG, Web. This is a type of Single Sourcing.

### Logic

Developers write logic in any language that compiles to WASM.

The code is WASM to WASM on the fly, via the Cloud Server, and synced back to your Editor or Disk.

That WASM runs in the Client and Server.

### Data

All data is stored on your local disk, and is a Git Repo.

All data is saved as pointers in the Git Repo with the real data on the backend S3 Server. THis is just a Git LFS. 

The actual data files lives in an S3 running locally or remotely.

The data types are: PDF, SVG, Images, Video, WASM, JSON

Interestly, the Output from the Edior are the same data types. So the S3 can save Build outputs as well as the working JSN data.

JSON data is used as a Database with SIMD acceleration for speed of indexing and parsng with a SQL language for Queries and mutations. 

A GraphQL database can also be fronted in front of the JSON Database allowing Queries, Subscriptions, Mutations. 

## Dependencies

The go-app  project( https://go-app.dev ) that allows building high quality GUI.

The GIO pluigns ( https://github.com/gioui-plugins/gio-plugins ) that provide the needed OS level GUI integrations.

## Network Topology

The system is a quasi decentralised network with the following structure.

In the Lab:

- A **NATS Leaf Server**.
  - When a new message is published to the NATS Server, it processes the message, does any computation, and updates the GUI. The GUI is a consumer of the post computation Messages.

In the Cloud:

- A **Web Server**.
  - Loads the GUI from in the Lab for Users.
- A **NATS Server**.
  - Brokers messages from this **NATS Server** to / from the NATS Leaf Server in the Lab.

In the users Browser:

- The **GUI**.
  - Serves the IDL
  - Loads the data from the **NATS Server** in the Cloud.

Other Labs:
- Run the same topology as above, allowing them to publish messages to and from other Labs.

