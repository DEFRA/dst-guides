# Making a payment with WorldPay

There are a number of steps involved in processing a WorldPay payment:

1. [Initial setup](#initial-setup)
1. [We send an XML request to WorldPay](#we-send-an-xml-request-to-worldpay)
1. [WorldPay sends an XML response containing a WorldPay URL](#worldpay-send-xml-request-to-worldpay)
1. [We redirect the user to WorldPay](#we-redirect-the-user-to-worldpay)
1. [User goes through payment steps on WorldPay](#user-goes-through-payment-steps-on-worldpay)
1. [WorldPay redirects the user back to our app](#worldpay-redirects-the-user-back-to-our-app)
1. [We validate the params from WorldPay](#we-validate-the-params-from-worldpay)
1. [Take actions depending on whether payment was successful](#take-actions-depending-on-whether-payment-was-successful)

## Initial setup

This is triggered when the user hits the `new` action in the `WorldpayController`.

We create a new finance_details, including an order containing all the required info.

Then we instantiate a `WorldpayService` to take care of our interactions with Worldpay and interact with other services.

## We send an XML request to WorldPay

The `WorldpayService` sends a request to Worldpay asking it to prepare for a new payment.

This request includes XML built by the `WorldpayXmlService`. The XML contains information about the order and our Worldpay account.

## WorldPay sends an XML response

WorldPay receives our XML and validates it.

If everything is in order, it sends back an XML response including a reference code and a URL to send users to for payment.

## We redirect the user to WorldPay

The `WorldpayUrlService` takes the URL we have received from Worldpay and adds several "return" URLs as params.

The "return" URLs are the URLs on our own app which the user will be redirected to after finishing their activity on the Worldpay website.

We provide different URLs for different results (like a successful payment or a cancelled payment).

Once we've built the full redirect URL with params, we redirect the user to it.

## User goes through payment steps on WorldPay

The user is now on the WorldPay website and goes through the usual steps to complete a payment. Or they may choose to cancel it.

## WorldPay redirects the user back to our app

WorldPay redirects the user back to the correct "return" URL for our app. Which URL is used depends on whether the payment was successful or not.

WorldPay also appends several params to the redirect URL.

## We validate the params from WorldPay

The `WorldpayValidatorService` checks the params we've received from WorldPay and makes sure they match what we expect.

We do this so we know the user has actually been redirected to the `success` or `failure` routes from WorldPay, rather than skipping ahead and attempting to log that payment has occurred.

The main way to check this is by validating the MAC. WorldPay generates one using a secret and sends it back to us. We then try to generate one using the same secret and make sure they match.

If params are invalid, the user is redirected to the payment summary page with an error message.

## Take actions depending on whether payment was successful

If payment was successful, we save a new `payment` object in the database and update the balance. We also update the relevant `order` to note that it has been paid for. Then we redirect user to the renewal complete or renewal received pages, depending on whether any further confirmation is needed or not.

If payment failed, we don't save a `payment`, but we do update the `order` to note that a WorldPay payment failed. Then we redirect the user to the payment summary page.
