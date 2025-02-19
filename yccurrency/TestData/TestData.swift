//
//  TestData.swift
//  yccurrency
//
//  Created by mac on 9/2/25.
//
let sampleMoneyExchangerJson = """
    [
      {
        "id": 1,
        "name": "Naing Ultra",
        "role": "Money Exchanger",
        "profileImage": "profile_pic",
        "contacts": [
          { "number": "66 81 234 5678", "countryCode": "TH" },
          { "number": "95 81 234 5678", "countryCode": "MM" }
        ],
        "rates": [
          { "fromCurrency": "MMK", "toCurrency": "THB", "amount": 757 },
          { "fromCurrency": "THB", "toCurrency": "MMK", "amount": 768 }
        ],
        "paymentMethods": [
          "krungthai",
          "bangkok_bank",
          "scb",
          "k_plus",
          "true_money",
          "kbz_pay",
          "wave_money"
        ]
      }
    ]
    """.data(using: .utf8)!

let sampleCurrencyHistoryJson = """
    {
        "nextStartDate": "2025-01-10",
        "data": [
            {
                "date": "09/02/2025",
                "transactions": []
            },
            {
                "date": "08/02/2025",
                "transactions": [
                    {
                        "time": "08:57 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,430.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,530.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "07/02/2025",
                "transactions": [
                    {
                        "time": "08:44 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,430.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,530.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "06/02/2025",
                "transactions": [
                    {
                        "time": "08:22 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "05/02/2025",
                "transactions": [
                    {
                        "time": "08:50 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "04/02/2025",
                "transactions": [
                    {
                        "time": "09:30 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "03/02/2025",
                "transactions": [
                    {
                        "time": "09:00 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "02/02/2025",
                "transactions": [
                    {
                        "time": "09:23 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "01/02/2025",
                "transactions": [
                    {
                        "time": "08:55 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,460.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,560.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "31/01/2025",
                "transactions": [
                    {
                        "time": "08:58 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,460.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,560.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "30/01/2025",
                "transactions": [
                    {
                        "time": "01:18 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "09:14 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,440.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,530.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "29/01/2025",
                "transactions": [
                    {
                        "time": "09:23 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,440.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,530.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "28/01/2025",
                "transactions": [
                    {
                        "time": "09:16 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,450.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,550.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "27/01/2025",
                "transactions": [
                    {
                        "time": "10:09 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,460.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,560.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "09:06 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,480.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,580.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "26/01/2025",
                "transactions": [
                    {
                        "time": "09:03 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,500.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "25/01/2025",
                "transactions": [
                    {
                        "time": "09:03 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,500.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "24/01/2025",
                "transactions": [
                    {
                        "time": "08:36 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,500.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "23/01/2025",
                "transactions": [
                    {
                        "time": "04:26 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,500.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "09:26 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "08:50 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,530.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,630.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "22/01/2025",
                "transactions": [
                    {
                        "time": "11:06 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,530.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,630.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "09:20 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "21/01/2025",
                "transactions": [
                    {
                        "time": "02:03 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "09:07 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,540.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,640.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "20/01/2025",
                "transactions": [
                    {
                        "time": "05:02 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "09:31 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,530.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,630.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "19/01/2025",
                "transactions": [
                    {
                        "time": "09:15 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "18/01/2025",
                "transactions": [
                    {
                        "time": "09:05 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,550.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,650.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "17/01/2025",
                "transactions": [
                    {
                        "time": "08:52 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "16/01/2025",
                "transactions": [
                    {
                        "time": "09:21 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,550.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,650.00",
                                "sign": "down"
                            }
                        ]
                    },
                    {
                        "time": "08:49 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,600.00",
                                "sign": "down"
                            },
                            {
                                "value": "4,700.00",
                                "sign": "down"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "15/01/2025",
                "transactions": [
                    {
                        "time": "04:52 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,700.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,800.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "10:56 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,650.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,750.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "08:59 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,640.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,740.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "14/01/2025",
                "transactions": [
                    {
                        "time": "11:08 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,580.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,680.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "08:47 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,560.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,650.00",
                                "sign": "up"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "13/01/2025",
                "transactions": [
                    {
                        "time": "02:36 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,550.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,630.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "02:36 PM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,540.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,620.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "11:46 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,530.00",
                                "sign": "up"
                            },
                            {
                                "value": "4,610.00",
                                "sign": "up"
                            }
                        ]
                    },
                    {
                        "time": "09:26 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "12/01/2025",
                "transactions": [
                    {
                        "time": "09:25 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            },
            {
                "date": "11/01/2025",
                "transactions": [
                    {
                        "time": "09:00 AM",
                        "unit": "1",
                        "prices": [
                            {
                                "value": "4,520.00",
                                "sign": "none"
                            },
                            {
                                "value": "4,600.00",
                                "sign": "none"
                            }
                        ]
                    }
                ]
            }
        ]
    }
    """.data(using: .utf8)!

// Example Usage
let sampleCurrencyJSON = """
    [
        {
            "id": 1,
            "code": "USD",
            "unit": "1$",
            "prices": [
                {
                    "value": "4,430.00",
                    "sign": "none"
                },
                {
                    "value": "4,530.00",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 2,
            "code": "EUR",
            "unit": "1€",
            "prices": [
                {
                    "value": "4,545.00",
                    "sign": "none"
                },
                {
                    "value": "4,665.00",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 3,
            "code": "SGD",
            "unit": "1S$",
            "prices": [
                {
                    "value": "3,260.00",
                    "sign": "down"
                },
                {
                    "value": "3,350.00",
                    "sign": "down"
                }
            ]
        },
        {
            "id": 4,
            "code": "THB",
            "unit": "1฿",
            "prices": [
                {
                    "value": "129.87",
                    "sign": "none"
                },
                {
                    "value": "133.33",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 5,
            "code": "JPY",
            "unit": "1¥",
            "prices": [
                {
                    "value": "29.05",
                    "sign": "up"
                },
                {
                    "value": "29.83",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 6,
            "code": "MYR",
            "unit": "1RM",
            "prices": [
                {
                    "value": "1,000.00",
                    "sign": "none"
                },
                {
                    "value": "1,022.00",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 7,
            "code": "CNY",
            "unit": "1CN¥",
            "prices": [
                {
                    "value": "603.00",
                    "sign": "up"
                },
                {
                    "value": "619.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 8,
            "code": "WON",
            "unit": "1₩",
            "prices": [
                {
                    "value": "3.02",
                    "sign": "down"
                },
                {
                    "value": "3.10",
                    "sign": "down"
                }
            ]
        },
        {
            "id": 9,
            "code": "GBP",
            "unit": "1£‎",
            "prices": [
                {
                    "value": "5,460.00",
                    "sign": "up"
                },
                {
                    "value": "5,605.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 10,
            "code": "AUD",
            "unit": "1A$",
            "prices": [
                {
                    "value": "2,755.00",
                    "sign": "none"
                },
                {
                    "value": "2,825.00",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 11,
            "code": "CAD",
            "unit": "1CA$",
            "prices": [
                {
                    "value": "3,075.00",
                    "sign": "up"
                },
                {
                    "value": "3,160.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 12,
            "code": "NTD",
            "unit": "1NT$",
            "prices": [
                {
                    "value": "133.00",
                    "sign": "none"
                },
                {
                    "value": "137.00",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 13,
            "code": "AED",
            "unit": "1د.إ",
            "prices": [
                {
                    "value": "1,197.00",
                    "sign": "up"
                },
                {
                    "value": "1,229.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 14,
            "code": "INR",
            "unit": "1₹",
            "prices": [
                {
                    "value": "50.17",
                    "sign": "up"
                },
                {
                    "value": "51.51",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 15,
            "code": "HKD",
            "unit": "1HK$",
            "prices": [
                {
                    "value": "565.00",
                    "sign": "up"
                },
                {
                    "value": "580.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 16,
            "code": "MOP",
            "unit": "1M$",
            "prices": [
                {
                    "value": "548.00",
                    "sign": "up"
                },
                {
                    "value": "563.00",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 17,
            "code": "LAK",
            "unit": "1₭",
            "prices": [
                {
                    "value": "0.20",
                    "sign": "none"
                },
                {
                    "value": "0.21",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 18,
            "code": "VND",
            "unit": "1₫",
            "prices": [
                {
                    "value": "0.17",
                    "sign": "none"
                },
                {
                    "value": "0.18",
                    "sign": "none"
                }
            ]
        },
        {
            "id": 19,
            "code": "PHP",
            "unit": "1₱",
            "prices": [
                {
                    "value": "75.67",
                    "sign": "up"
                },
                {
                    "value": "77.69",
                    "sign": "up"
                }
            ]
        },
        {
            "id": 20,
            "code": "KHR",
            "unit": "1៛",
            "prices": [
                {
                    "value": "1.09",
                    "sign": "none"
                },
                {
                    "value": "1.12",
                    "sign": "none"
                }
            ]
        }
    ]
    """.data(using: .utf8)!
