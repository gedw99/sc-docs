# sc-gio

This is the docs repo of the Open Science project.

![](logo.png)

## Aims

- Reproducibility: GUI, Logic and Data all in one place, allowing Scienists to review each others work.

- Accessibility: Easy to use, and run locally in your Lab , with a Public Entry point to allow the public to participate.

- Secure: Accounts to control who can see and do what.

Its very much a work in progress as we try approaches out.

Its made up of an Editor and Renderer.

## Editor

The GUI to allow you to edit the source via a WYSIWYG GUI.

When you change something, we rewrite the IDL source and the Renderer redraws.

## Renderer

Render targets are:

PDF, PNG, SVG, Web.

It allows Single Sourcing in that you can use just Deck source to output all the Rendering targets at once.

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
  - Loads the GUI from in the Lab. 
- A **NATS Server**.
  - Brokers messages from this **NATS Server** to / from the NATS Leaf Server in the Lab.

In the users Browser:

- The **GUI**.
  - Serves the Deck slides 
  - Loads the data from the **NATS Server** in the Cloud.

Other Labs:
- Run the same topology as above, allowing them to publish messages to and from other Labs.

