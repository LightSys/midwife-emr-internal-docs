module Verbage exposing (..)

import String
import Template exposing (template, render, withValue, withString)
import Template.Infix exposing (..)


-- LOCAL IMPORTS

import Model exposing (Model, VerbageRecord)


learnIntro : String
learnIntro =
    """

**Midwife-EMR** is software that is specifically made for midwives in order to
help them manage patient medical records. Midwife-EMR is designed for the full
breadth of pregnancy care from prenatal through labor/delivery and postpartum
*(labor/delivery still in development)*.

<img style="float: right" src="src/assets/IMG_7206_cropped_96x96.JPG" >
Midwife-EMR is free, open-source software that is able to run on a number of
different computer devices including a small appliance like this Odroid or
a laptop/desktop. But since Midwife-EMR is a browser application, that
means that midwives can use the application on everything from their
computers to their phones or tablets.

    """


featuresIntro : String
featuresIntro =
    """

Midwife-EMR has a number of features that are designed to the
particular needs of midwives.

- **Easy** to use web pages.
- Midwifes can use it on their **desktops, laptops, tablets and phones**.
- **No Internet required** to work.
- **Fast** patient searches on a number of different criteria.
- Quickly **generates reports** as required by the **Department of Health** and **PHIC**.
- **Unlimited** number of patients.
- **Strong security features**.

    """


howIntro : String
howIntro =
    """

Midwives find that **Midwife-EMR is easy to learn and here you can find answers
to any questions that you may have as you begin to explore using Midwife-EMR.

** how do I ...?**

- setup my Midwife-EMR appliance for the first time?
- add midwives and staff to Midwife-EMR?
- understand what the different roles are?
- generate a report?
- more ...

    """


trainingIntro : String
trainingIntro =
    """

Does your staff need additional training? Do you need help understanding how to
setup your initial medicines, vaccinations, and other tables? Do you wonder
what is the best way to start using Midwife-EMR in your clinic?

Watch our training videos to find out more about these topics and many more.

    """


howPageCards : Model -> List VerbageRecord
howPageCards model =
    [ { body = howSetup
      , title = "Setup the Midwife-EMR appliance for the first time?"
      , teaser = """

How to install and setup the Midwife-EMR appliance. Follow these instructions
to get started.

        """
      }
    , { body = howRoles
      , title = "What are the different roles in Midwife-EMR?"
      , teaser = """

What do roles mean in Midwife-EMR? Find out so that you can use Midwife-EMR and
take advantage of the various features that it offers.

        """
      }
    ]


howSetup : String
howSetup =
    """

**Note: if you are reading these instructions from the Midwife-EMR appliance
already, you have already done this.**

1. Verify that you have all of the pieces of the Midwife-EMR appliance.

- The appliance itself.
- The power adapter for the appliance.
- The wireless USB antenna.
- Optionally, a ethernet cable if you are going to attach it into your own network.

1. Plug the wireless antenna into one of the USB ports on the appliance. It
does not matter which one of the four ports it is plugged into.

1. Plug the power adapter into A/C power and then into the appliance itself.
There is only one hole in the appliance that this fits into and it is labeled
"5V-4A" underneath the hole.

1. Wait for the appliance to come online, usually in less than one minute.

1. Now using a device that can connect to a wireless network such as a laptop,
tablet or phone, look for the new wireless network called "Midwife-EMR".

1. Log into this network with the password "midwife".

1. Once you are logged in, use your web browser to go to
**https://192.168.222.1**.

    """


howRoles : String
howRoles =
    """

The "roles" in Midwife-EMR are like job descriptions. Midwife-EMR
recognizes that many clinics have staff that are midwives and/or nurses and
other staff that are clerks, etc. Of course, in your clinic your director
may decide not to use the roles or to use some of them only. That is fine
because roles exist to make the Midwife-EMR system easier to use and you
can use it as seems best for your clinic.

So, what are the roles? There are five (5) roles within Midwife-EMR.

**Administrator:** The administrator is a person that can set up the
Midwife-EMR system for your clinic. The administrator cannot view or edit
any patient data. Instead, the administrator's role enables that person or
persons to do things like manage users (add, edit, deactivate), manage
medications and vaccinations, set the clinic name, address and other
information, etc.

**Supervisor:**

**Clerk:**

**Guard:**

**Attending:**


    """



{-
   ### add midwives and staff to Midwife-EMR?




   ### generate a report?
-}


usePageCards : Model -> List VerbageRecord
usePageCards model =
    [ { body = (viewUseNow model)
      , title = "Go to Midwife-EMR Now"
      , teaser = """

If you have already installed the CA Certificate (see below), start using [Midwife-EMR](https://localhost).

        """
      }
    , { body = viewUseCAInstructions
      , title = "Installing the CA Certificate"
      , teaser = """

Before you can use the Midwife-EMR system, you need to install a CA certificate
on each computer, tablet, and phone that will be using it. Find out how.

        """
      }
    ]


viewUseNow : Model -> String
viewUseNow model =
    let
        wlan =
            case String.length model.wlan0IP > 0 of
                True ->
                    render (template "- [https://" <% .wlan0IP %> "](https://" <% .wlan0IP %> ")") model

                False ->
                    ""

        elan =
            case String.length model.eth0IP > 0 of
                True ->
                    render (template "- [https://" <% .eth0IP %> "](https://" <% .eth0IP %> ")") model

                False ->
                    ""

        content =
            render
                (template """

## I want to use it now

            """
                    |> withString "\n"
                    |> withString elan
                    |> withString "\n"
                    |> withString wlan
                )
                model
    in
        content


viewUseCAInstructions : String
viewUseCAInstructions =
    """

## Why Security?

Security about medical records is very important and Midwife-EMR takes security
seriously. That is why there are special, extra steps that you need to take
before you can use the Midwife-EMR system. These steps help insure that the
computers, tablets, and phones that you have specifically configured are able
to access the Midwife-EMR system.


## What Needs to be Done

Any computer, tablet, or phone that needs to log into your Midwife-EMR system
will need to have a CA certificate installed in it first. What is a CA
certificate? It is simply a file - it is not a program or an app - it is just a
file that tells your computer, tablet, or phone the information it needs to
know about the Midwife-EMR system.

What follows are the instructions for your various devices such as computers,
tablets, and phones. There are separate instructions for each - it would be
nice if the way to installing the file was the same for each, but unfortunately
it is not. That is not the fault of Midwife-EMR, that is just the way that the
computers, tablets, and phones were made. Below you will find specific
instructions for each type of device that you have. Please refer to each
section as necessary depending on the type of device. It is likely that you
will have many different types of devices, for example, someone will have a
laptop and someone else will have a phone, etc.

### Computers - Desktops and Laptops

**See below for Mac OSX**

For computers, both desktops and laptops, the CA certificate is installed in
the web browser being used. There are instructions for Chrome and Firefox
below. What this means is that if you will be using the Firefox web browser on
the computer, follow the Firefox instructions. If using Chrome, the Chrome
instructions.

#### Chrome Web Browser

#### Firefox Web Browser

### Mac OSX

### Android Tablets and Phones

**See below for iPhone and iPad**






    """
