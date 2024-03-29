{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyOLu2EYws/KtyQ+HoHxWrRr",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/kateryna-hetalo/-R_CourseKNU/blob/main/R_lab1.md\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# Лабораторна робота № 1. Завантаження та зчитування даних"
      ],
      "metadata": {
        "id": "FH__mp6xpAhD"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "1. За допомогою download.file() завантажте любий excel файл з порталу \n",
        "http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому \n",
        "встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму \n",
        "даних."
      ],
      "metadata": {
        "id": "M_yVpVTqpX4j"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "```\n",
        "# 1 download random file from data.gov.ua\n",
        "file<-tempfile('myfile',fileext=\".csv\")\n",
        "my_url<-\"https://data.gov.ua/dataset/1e032f5b-7145-4f36-a0ee-53b96cacd87f/resource/00ddd734-447a-4b4e-999c-74186abe7bbc/download/contracts-2022-01.csv\"\n",
        "download.file(url=my_url,destfile=file,mode=\"wb\")\n",
        "df1=read.csv(file)\n",
        "head(df1)\n",
        "```"
      ],
      "metadata": {
        "id": "A8fIn3Ihqrnm"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "Results:     \n",
        "\n",
        "```    \n",
        "number              dateSigned     periodEndDate    \n",
        "1 Номер договору Дата укладення договору Дата дії договору    \n",
        "2              6              2022-01-26        2022-12-31   \n",
        "3              7              2022-01-27        2022-12-31   \n",
        "4              8              2022-01-27        2022-12-31   \n",
        "5    01/02/22-ТО              2022-02-18        2022-12-31   \n",
        "6          _2-22              2022-01-01        2022-12-31    \n",
        "\n",
        "```"
      ],
      "metadata": {
        "id": "XV2IjAJIpmag"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "2. За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за\n",
        "посиланням\n",
        "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та\n",
        "завантажте дані в R. Code book, що пояснює значення змінних\n",
        "знаходиться за посиланням\n",
        "https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0\n",
        "Необхідно знайти, скільки property мають value $1000000+\n"
      ],
      "metadata": {
        "id": "yyYpCYWxpmka"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "```\n",
        "# 2 download getdata_data_ss06hid.csv\n",
        "url2<-\"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv\"\n",
        "file2<-tempfile('myfile',fileext=\".csv\")\n",
        "download.file(url=url2,destfile=file2,mode=\"wb\")\n",
        "df2=read.csv(file2)\n",
        "head(df2)\n",
        "# select rows with FINCP grearter than 1000000\n",
        "sum(df2$VAL==24 & !is.na(df2$VAL))\n",
        "```\n",
        "Results:\n",
        "```\n",
        "53\n",
        "```"
      ],
      "metadata": {
        "id": "otUIM5yIrPuH"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "3. Зчитайте xml файл за посиланням\n",
        "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml\n",
        "Скільки ресторанів мають zipcode 21231?"
      ],
      "metadata": {
        "id": "vtUi3TEHpmwN"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "\n",
        "\n",
        "```\n",
        "# 3 explore xml\n",
        "\n",
        "url3<-\"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml\"\n",
        "file3<-tempfile('myfile',fileext=\".xml\")\n",
        "download.file(url=url3,destfile=file3,mode=\"wb\")\n",
        "install.packages(\"XML\")\n",
        "# Load the package required to read XML files.\n",
        "library(\"XML\")\n",
        "\n",
        "# Also load the other required package.\n",
        "library(\"methods\")\n",
        "\n",
        "# Give the input file name to the function.\n",
        "xml_data <- xmlParse(url3, useInternal = TRUE )\n",
        "data3 <- xmlRoot(xml_data)\n",
        "xmlName(data3)\n",
        "zip <- xpathSApply(data3, \"//zipcode\", xmlValue)\n",
        "sum(zip == 21231, na.rm = TRUE)\n",
        "```\n",
        "Results:\n",
        "```\n",
        "127\n",
        "```\n"
      ],
      "metadata": {
        "id": "rKB4JrGwtPH7"
      }
    }
  ]
}