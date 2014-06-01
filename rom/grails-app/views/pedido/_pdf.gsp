<%@ page import="rom.Promocion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Ticket</title>
        <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
        <style type="text/css">
            @page { size:5in 11in; margin: 0px; }
            .ticketTitle {
                text-align: center;
                border-bottom: 1px solid black;
                padding-top: -20px;
                padding-bottom: 20px;
            }
            .rowItem {
                display: inline-block;
                width: 49%;
            }
            .rowTitles {
                display: inline-block;
                width: 24%;
            }
            .pull-right {
                float: left;
            }
            .pull-right {
                float: right;
            }
            .center {
                width: 100%;
                text-align: center;
            }
            table {
                margin-top: 20px;
                border-collapse: collapse;
                width:100%;
            }
            th {
                text-align:right;
                border-bottom: 1px solid black;
            }
            th.left {
                text-align:left;
                border-bottom: 1px solid black;
            }
            td {
                text-align:right;
            }
            td.left {
                text-align:left;
            }
            .rowSubtotal {
                border-top: 1px solid black;
                padding-top: 10px;
            }
            .rowCoupon {
                padding-top: 10px;
            }
            .rowTotal {
                border-top: 1px solid black;
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        <section id="pdf" class="first">
            <g:render template="ticket"/>
        </section>
    </body>
</html>
