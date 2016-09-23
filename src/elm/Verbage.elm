module Verbage exposing (..)

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
      , title = "First time setup?"
      , teaser = """

How to install and setup the Midwife-EMR appliance. Follow these instructions
to get started.

        """
      }
    , { body = howRoles
      , title = "What are Midwife-EMR roles?"
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
already, you probably have already done this.**

1. Verify that you have all of the pieces of the Midwife-EMR appliance.

- The appliance itself.
- The power adapter for the appliance.
- The wireless USB antenna (optional).
- A ethernet cable if you are going to attach it into your own network (again optional).

**Note: the wireless USB antenna and the ethernet cable connecting to your
router are optional in the sense that you do not need them both. But you do
need at least one of them in order to use the Midwife-EMR application.**

1. Plug either the wireless antenna into one of the USB ports on the appliance
or the ethernet cable into the ethernet port on your appliance.

   - TODO: pictures here

1. Plug the power adapter into A/C power and then into the appliance itself.
There is only one hole in the appliance that this fits into and it is labeled
"5V-4A" underneath the hole.

   - TODO: picture

1. Wait for the appliance to come online, usually in less than one minute.

1. **If using the wireless antenna:** Now using a device that can connect to a
wireless network such as a laptop, tablet or phone, look for the new wireless
network called "Midwife-EMR".

   1. Log into this network with the password "midwife".

   1. Once you are logged in, use your web browser to go to
   **[https://192.168.222.1](https://192.168.222.1)**.

1. **If using the ethernet cable:** You will need to login to your router in
order to find the IP address that has been assigned to the Midwife-EMR
appliance. Once you have that address, use your web browser to go to it.

   - For example, if you router assigned the Midwife-EMR appliance an address
   of **192.168.0.23**, you would type this address into your browser address
   bar: **https://192.168.0.23**

   - Do not forget to type **https**. If you type **http** (without the "s"),
   then you will arrive at the documentation pages (same as you are reading
   now).

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


setupPageCards : List VerbageRecord
setupPageCards =
    [ { body = viewSetupNow
      , title = "Go to Midwife-EMR Now"
      , teaser = """

If you have already installed the CA Certificate (see below), start using **Midwife-EMR** now.

        """
      }
    , { body = viewSetupWhyCA
      , title = "Why use a CA Certificate?"
      , teaser = """

In order to maintain security, before you can use the Midwife-EMR system, you
need to install a CA certificate on each computer, tablet, and phone that will
be using it.

        """
      }
    , { body = viewSetupCAInstructionsChromium
      , title = "Install a CA Certificate in Chromium"
      , teaser = """

Find out how to install the CA certificate in your Chromium web browser if you are using a desktop, laptop, or Mac.

        """
      }
    , { body = viewSetupCAInstructionsFirefox
      , title = "Install a CA Certificate in Firefox"
      , teaser = """

Find out how to install the CA certificate in your Firefox web browser if you are using a desktop, laptop, or Mac.

        """
      }
    , { body = viewSetupCAInstructionsAndroid
      , title = "Install a CA Certificate in an Android device"
      , teaser = """

Find out how to install the CA certificate in your Android phone or tablet.

        """
      }
    , { body = viewSetupCAInstructionsIPadPhone
      , title = "Install a CA Certificate in an Apple device"
      , teaser = """

Find out how to install the CA certificate in your Apple iPhone or iPad.

        """
      }
    ]


viewSetupNow : String
viewSetupNow =
    """

##### Start Now

Use the link in the top right corner of this page to start using Midwife-EMR now.

    """


viewSetupWhyCA : String
viewSetupWhyCA =
    """

##### Security

Security about medical records is very important and Midwife-EMR
takes security seriously. That is why there are special, extra steps that you
need to take before you can use the Midwife-EMR system. These steps help insure
that the computers, tablets, and phones that you have specifically configured
are able to access the Midwife-EMR system.


##### What do I do?

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

    """


viewSetupCAInstructionsChromium : String
viewSetupCAInstructionsChromium =
    """

###### Chromium Web Browser

1. First you need the CA certificate file, which you can download here:
<a href="midwife-emr-ca.crt">Midwife-EMR CA Certificate</a>. Please save this
file where you know you can find it for the steps that follow. (The desktop is
often a good choice.)

1. <img style="float: right" src="src/assets/ChromiumMenu.png" > First, open settings in the Chromium browser which are in the upper right hand corner. Click on the three dots you see. Choose the **Settings** menu item.

1. Scroll to the bottom of the new page shown and click on the **Show advanced
settings...** link.

1. <img style="float: right" src="src/assets/ChromiumManageCertificatesButton.png" > Scroll farther down now
and find the section called **HTTPS/SSL**. Click on the **Manage certificates**
button.

1. This will open a dialog called the **Certificate Manager**. First choose the
third tab at the top called **Authorities** and then click the **Import...**
button at the bottom. It is important that you click the import button on the
Authorities tab, not on any other tab.

   <img src="src/assets/ChromiumCertificateManager2.png" >

1. Find the CA certificate file that you downloaded in step 1 above. Choose
this file and press the Open button in the file selection dialog.

1. You will see the Certificate Authority dialog next and you need to check the
top checkbox and then click on Ok.

   <img src="src/assets/ChromiumImportDialog2.png" >

1. (Optional) In order to confirm that the certificate was imported into
Chromium, scroll through the list until you find the Midwife-EMR certificate. The
certificates are sorted by name so it should be located somewhere close to the
middle of the list. After you see it, you can click the **Done** button to
close the Certificate Manager dialog.

   <img src="src/assets/ChromiumImportedCert.png" >

Now you are ready to begin using the Midwife-EMR system.

    """


viewSetupCAInstructionsFirefox : String
viewSetupCAInstructionsFirefox =
    """

###### Firefox Web Browser


    """


viewSetupCAInstructionsAndroid : String
viewSetupCAInstructionsAndroid =
    """

##### Android Tablets and Phones

**See below for iPhone and iPad**



    """


viewSetupCAInstructionsIPadPhone : String
viewSetupCAInstructionsIPadPhone =
    """

##### Apple iPad and iPhone


    """
