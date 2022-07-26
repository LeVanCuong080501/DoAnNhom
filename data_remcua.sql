USE [sum35047_remcua]
GO
/****** Object:  Table [dbo].[admin_AccessGroupUserForm]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessGroupUserForm](
	[guf_id] [int] IDENTITY(1,1) NOT NULL,
	[guf_active] [bit] NULL,
	[groupuser_id] [int] NULL,
	[form_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[guf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_AccessGroupUserModule]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessGroupUserModule](
	[gum_id] [int] IDENTITY(1,1) NOT NULL,
	[gum_active] [bit] NULL,
	[groupuser_id] [int] NULL,
	[module_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[gum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_AccessUserForm]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_AccessUserForm](
	[uf_id] [int] IDENTITY(1,1) NOT NULL,
	[uf_active] [bit] NULL,
	[username_id] [int] NULL,
	[form_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_Form]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Form](
	[form_id] [int] IDENTITY(1,1) NOT NULL,
	[form_position] [int] NULL,
	[form_name] [nvarchar](max) NULL,
	[form_link] [nvarchar](max) NULL,
	[form_active] [bit] NULL,
	[module_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_GroupUser]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_GroupUser](
	[groupuser_id] [int] IDENTITY(1,1) NOT NULL,
	[groupuser_name] [nvarchar](max) NULL,
	[groupuser_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupuser_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_Module]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Module](
	[module_id] [int] IDENTITY(1,1) NOT NULL,
	[module_position] [int] NULL,
	[module_name] [nvarchar](max) NULL,
	[module_icon] [nvarchar](max) NULL,
	[module_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin_User]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_User](
	[username_id] [int] IDENTITY(1,1) NOT NULL,
	[username_username] [nvarchar](max) NULL,
	[username_password] [nvarchar](max) NULL,
	[username_fullname] [nvarchar](max) NULL,
	[username_gender] [bit] NULL,
	[username_phone] [nvarchar](max) NULL,
	[username_email] [nvarchar](max) NULL,
	[username_active] [bit] NULL,
	[groupuser_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbCity]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCity](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [nvarchar](max) NULL,
	[city_position] [int] NULL,
	[city_show] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbIntroduce]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbIntroduce](
	[introduct_id] [int] IDENTITY(1,1) NOT NULL,
	[introduce_title] [nvarchar](max) NULL,
	[introduce_summary] [nvarchar](max) NULL,
	[introduce_content] [nvarchar](max) NULL,
	[introduce_title1] [nvarchar](max) NULL,
	[introduce_active] [bit] NULL,
	[introduce_image] [nvarchar](max) NULL,
	[introduce_dateup] [date] NULL,
	[meta_tittle] [nvarchar](max) NULL,
	[meta_keywords] [nvarchar](max) NULL,
	[meta_description] [nvarchar](max) NULL,
	[meta_image] [nvarchar](max) NULL,
	[link_seo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[introduct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbNewCate]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNewCate](
	[newcate_id] [int] IDENTITY(1,1) NOT NULL,
	[newcate_title] [nvarchar](max) NULL,
	[newcate_summary] [nvarchar](max) NULL,
	[hidden] [bit] NULL,
	[link_seo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[newcate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbNews]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNews](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[news_title] [nvarchar](max) NULL,
	[news_summary] [nvarchar](max) NULL,
	[news_image] [nvarchar](max) NULL,
	[news_content] [nvarchar](max) NULL,
	[newcate_id] [int] NULL,
	[hidden] [bit] NULL,
	[active] [bit] NULL,
	[link_seo] [nvarchar](max) NULL,
	[news_datetime] [datetime] NULL,
	[news_position] [nvarchar](max) NULL,
	[meta_tittle] [nvarchar](max) NULL,
	[meta_keywords] [nvarchar](max) NULL,
	[meta_description] [nvarchar](max) NULL,
	[meta_image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbProduct]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProduct](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_position] [int] NULL,
	[product_title] [nvarchar](max) NULL,
	[product_image] [nvarchar](max) NULL,
	[product_summary] [nvarchar](max) NULL,
	[product_content] [nvarchar](max) NULL,
	[product_quantum] [int] NULL,
	[product_show] [bit] NULL,
	[product_new] [bit] NULL,
	[productcate_id] [int] NULL,
	[title_web] [nvarchar](max) NULL,
	[meta_title] [nvarchar](max) NULL,
	[meta_keywords] [nvarchar](max) NULL,
	[meta_description] [nvarchar](max) NULL,
	[h1_seo] [nvarchar](max) NULL,
	[link_seo] [nvarchar](max) NULL,
	[product_chungloai] [nvarchar](max) NULL,
	[thuonghieu_id] [int] NULL,
	[meta_image] [nvarchar](max) NULL,
	[product_representative] [int] NULL,
	[product_cart] [int] NULL,
	[product_price_new] [int] NULL,
	[product_price] [int] NULL,
	[product_promotions] [int] NULL,
	[product_price_entry] [int] NULL,
	[product_date] [date] NULL,
	[color_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbProductCate]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProductCate](
	[productcate_id] [int] IDENTITY(1,1) NOT NULL,
	[productcate_position] [int] NULL,
	[productcate_title] [nvarchar](max) NULL,
	[productcate_show] [bit] NULL,
	[productgroup_id] [int] NULL,
	[title_web] [nvarchar](max) NULL,
	[meta_title] [nvarchar](max) NULL,
	[meta_keywords] [nvarchar](max) NULL,
	[meta_description] [nvarchar](max) NULL,
	[h1_seo] [nvarchar](max) NULL,
	[link_seo] [nvarchar](max) NULL,
	[productcate_parent] [int] NULL,
	[productcate_content] [nvarchar](max) NULL,
	[meta_image] [nvarchar](max) NULL,
	[produtcate_icon] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[productcate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSlide]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSlide](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[slide_image] [nvarchar](max) NULL,
	[slide_title] [nvarchar](max) NULL,
	[slide_title1] [nvarchar](max) NULL,
	[slide_link] [nvarchar](max) NULL,
	[slide_summary] [nvarchar](max) NULL,
	[slide_content] [nvarchar](max) NULL,
	[hidden] [bit] NULL,
	[slide_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sum35047_remcua].[tbColor]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sum35047_remcua].[tbColor](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[color_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sum35047_remcua].[tbContact]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sum35047_remcua].[tbContact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[contact_address] [nvarchar](max) NULL,
	[contact_email] [nvarchar](max) NULL,
	[contact_link] [nvarchar](max) NULL,
	[contact_hotline] [nvarchar](max) NULL,
	[contact_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sum35047_remcua].[tbCustomer]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sum35047_remcua].[tbCustomer](
	[cus_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_name] [nvarchar](max) NULL,
	[cus_email] [nvarchar](max) NULL,
	[cus_phone] [nvarchar](max) NULL,
	[cus_content] [nvarchar](max) NULL,
	[cus_date] [datetime] NULL,
	[cus_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sum35047_remcua].[tbDangKyEmail]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sum35047_remcua].[tbDangKyEmail](
	[dke_id] [int] IDENTITY(1,1) NOT NULL,
	[dke_email] [nvarchar](max) NULL,
	[dke_tinhtrang] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[dke_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sum35047_remcua].[tbOrder]    Script Date: 29/04/2022 10:31:08 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sum35047_remcua].[tbOrder](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_product] [nvarchar](max) NULL,
	[order_custumer] [nvarchar](max) NULL,
	[order_email] [nvarchar](max) NULL,
	[order_address] [nvarchar](max) NULL,
	[order_date] [date] NULL,
	[order_phone] [nvarchar](max) NULL,
	[order_content] [nvarchar](max) NULL,
	[order_amount] [int] NULL,
	[order_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserForm] ON 

INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (5, 1, 1, 5)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (6, 1, 1, 6)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (7, 1, 1, 7)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (8, 1, 1, 8)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (10, 1, 1, 10)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (11, 1, 1, 11)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (12, 1, 1, 12)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (13, 1, 1, 13)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (14, 1, 2, 5)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (15, 1, 2, 6)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (16, 1, 2, 7)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (17, 1, 2, 8)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (18, 1, 2, 10)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (19, 1, 2, 11)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (20, 1, 2, 12)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (21, 1, 2, 13)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (22, 1, 1, 14)
INSERT [dbo].[admin_AccessGroupUserForm] ([guf_id], [guf_active], [groupuser_id], [form_id]) VALUES (23, 1, 1, 15)
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserForm] OFF
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserModule] ON 

INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (5, 1, 1, 5)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (6, 1, 2, 3)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (7, 1, 2, 4)
INSERT [dbo].[admin_AccessGroupUserModule] ([gum_id], [gum_active], [groupuser_id], [module_id]) VALUES (8, 1, 2, 5)
SET IDENTITY_INSERT [dbo].[admin_AccessGroupUserModule] OFF
SET IDENTITY_INSERT [dbo].[admin_AccessUserForm] ON 

INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (2, 1, 1, 2)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (3, 1, 1, 3)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (4, 1, 1, 4)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (5, 1, 1, 5)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (6, 1, 1, 6)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (7, 1, 1, 7)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (8, 1, 1, 8)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (10, 1, 1, 10)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (11, 1, 1, 11)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (12, 1, 1, 12)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (13, 1, 1, 13)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (14, 1, 2, 5)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (15, 1, 2, 6)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (16, 1, 2, 7)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (17, 1, 2, 8)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (18, 1, 2, 10)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (19, 1, 2, 11)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (20, 1, 2, 12)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (21, 1, 2, 13)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (22, 1, 1, 14)
INSERT [dbo].[admin_AccessUserForm] ([uf_id], [uf_active], [username_id], [form_id]) VALUES (23, 1, 1, 15)
SET IDENTITY_INSERT [dbo].[admin_AccessUserForm] OFF
SET IDENTITY_INSERT [dbo].[admin_Form] ON 

INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (1, 1, N'Quản lý phân quyền', N'admin-access', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (2, 2, N'Quản lý Module', N'admin-module', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (3, 3, N'Quản lý Form', N'admin-form', 1, 1)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (4, 1, N'Quản lý nhân sự', N'admin-account', 1, 2)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (5, 1, N'Slide', N'admin-slide', 1, 3)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (6, 2, N'Giới thiệu', N'admin-introduce', 1, 3)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (7, 2, N'Loại sản phẩm', N'admin-product-cate', 1, 4)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (8, 2, N'Sản phẩm', N'admin-product', 1, 4)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (10, 2, N'Tin tức', N'admin-new', 1, 5)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (11, 3, N'Thông báo', N'admin-thong-bao', 1, 3)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (12, 2, N'Liên hệ', N'admin-lien-he', 1, 3)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (13, 4, N'Thư liên hệ', N'admin-khach-hang', 1, 3)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (14, 1, N'Đặt Hàng', N'admin-product-order', 1, 4)
INSERT [dbo].[admin_Form] ([form_id], [form_position], [form_name], [form_link], [form_active], [module_id]) VALUES (15, 1, N'Nhóm Sản Phẩm', N'admin-product-group', 1, 4)
SET IDENTITY_INSERT [dbo].[admin_Form] OFF
SET IDENTITY_INSERT [dbo].[admin_GroupUser] ON 

INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (1, N'root', 1)
INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (2, N'Admin', 1)
INSERT [dbo].[admin_GroupUser] ([groupuser_id], [groupuser_name], [groupuser_active]) VALUES (3, N'Employees
', 1)
SET IDENTITY_INSERT [dbo].[admin_GroupUser] OFF
SET IDENTITY_INSERT [dbo].[admin_Module] ON 

INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (1, 1, N'Phân quyền', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (2, 2, N'Tài khoản', N'fas fa-users', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (3, 3, N'Quản lý Website', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (4, 4, N'Quản lý sản phẩm', N'', 1)
INSERT [dbo].[admin_Module] ([module_id], [module_position], [module_name], [module_icon], [module_active]) VALUES (5, 5, N'Quản lý tin tức', N'', 1)
SET IDENTITY_INSERT [dbo].[admin_Module] OFF
SET IDENTITY_INSERT [dbo].[admin_User] ON 

INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (1, N'root', N'12378248145104161527610811213823414203124130', N'ROOT', 1, N'01634057167', N'qutienpro@gmail.com', 1, 1)
INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (2, N'admin', N'12378248145104161527610811213823414203124130', N'Quản trị', 1, N'12345', N'quantri@hifiveplus.vn', 1, 2)
INSERT [dbo].[admin_User] ([username_id], [username_username], [username_password], [username_fullname], [username_gender], [username_phone], [username_email], [username_active], [groupuser_id]) VALUES (3, N'staff', N'12378248145104161527610811213823414203124130', N'Nhân viên', 0, N'67891', N'staff@hifiveplus.vn', 1, 3)
SET IDENTITY_INSERT [dbo].[admin_User] OFF
SET IDENTITY_INSERT [dbo].[tbCity] ON 

INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (1, N'An Giang', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (2, N'Bà Rịa - Vũng Tàu
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (3, N'Bắc Giang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (4, N'Bắc Kạn
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (5, N'Bạc Liêu
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (6, N'Bắc Ninh
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (7, N'Bến Tre
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (8, N'Bình Định
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (9, N'Bình Dương
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (10, N'Bình Phước
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (11, N'Bình Thuận
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (12, N'Cà Mau
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (13, N'Cao Bằng
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (14, N'Đắk Lắk
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (15, N'Đắk Nông
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (16, N'Điện Biên
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (17, N'Đồng Nai
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (18, N'Đồng Tháp
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (19, N'Gia Lai
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (20, N'Hà Giang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (21, N'Hà Nam
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (22, N'Hà Tĩnh
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (23, N'Hải Dương
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (24, N'Hậu Giang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (25, N'Hòa Bình
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (26, N'Hưng Yên
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (27, N'Khánh Hòa
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (28, N'Kiên Giang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (29, N'Kon Tum
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (30, N'Lai Châu
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (31, N'Lâm Đồng
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (32, N'Lạng Sơn
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (33, N'Lào Cai
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (34, N'Long An
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (35, N'Nam Định
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (36, N'Nghệ An
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (37, N'Ninh Bình
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (38, N'Ninh Thuận
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (39, N'Phú Thọ
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (40, N'Quảng Bình
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (41, N'Quảng Nam
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (42, N'Quảng Ngãi
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (43, N'Quảng Ninh
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (44, N'Quảng Trị
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (45, N'Sóc Trăng
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (46, N'Sơn La
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (47, N'Tây Ninh
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (48, N'Thái Bình
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (49, N'Thái Nguyên
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (50, N'Thanh Hóa
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (51, N'Thừa Thiên Huế
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (52, N'Tiền Giang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (53, N'Trà Vinh
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (54, N'Tuyên Quang
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (55, N'Vĩnh Long
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (56, N'Vĩnh Phúc
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (57, N'Yên Bái
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (58, N'Phú Yên
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (59, N'Cần Thơ
', NULL, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (60, N'Đà Nẵng
', 1, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (61, N'Hải Phòng
', 2, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (62, N'Hà Nội
', 3, NULL)
INSERT [dbo].[tbCity] ([city_id], [city_name], [city_position], [city_show]) VALUES (63, N'TP HCM
', 4, NULL)
SET IDENTITY_INSERT [dbo].[tbCity] OFF
SET IDENTITY_INSERT [dbo].[tbIntroduce] ON 

INSERT [dbo].[tbIntroduce] ([introduct_id], [introduce_title], [introduce_summary], [introduce_content], [introduce_title1], [introduce_active], [introduce_image], [introduce_dateup], [meta_tittle], [meta_keywords], [meta_description], [meta_image], [link_seo]) VALUES (1, N'Rèm cửa', NULL, N'<p><strong>DNTN PHỤ KIỆN MÀN RÈM CỬA 24H</strong>&nbsp;xin chân thành cảm ơn các quý khách hàng đã tin tưởng và sử dụng các sản phẩm do chúng tôi cung cấp. Trong nhiều năm qua&nbsp;<strong>DNTN PHỤ KIỆN MÀN RÈM CỬA <strong style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">24H</strong></strong>&nbsp;đã khẳng định là thương hiệu chuyên nghiệp, sản phẩm đa dạng, tiêu thụ rộng lớn trên toàn quốc. Để đáp ứng một cách tốt nhất cho khách hàng từ những công trình dân dụng cho đến cao cấp và hiện đại.&nbsp;</p>

                        <p>&nbsp;</p>

                        <p>DNTN PHỤ KIỆN MÀN RÈM CỬA 24H CHUYÊN CUNG CẤP&nbsp;:</p>

                        <p>&nbsp;</p>

                        <p>- Các loại phụ kiện màn rèm cửa</p>

                        <p>- Các loại vải màn rèm</p>

                        <p>- May rèm theo yêu cầu</p>

                        <p>&nbsp;</p>

                        <p>Với những mẫu thiết kế đa dạng mang phong cách sang trọng, hiện đại, các loại&nbsp;rèm vải , Rèm văn phòng,&nbsp;rèm cuốn&nbsp; ... trang trí nội thất đang ngày càng được ưa chuộng đặc biệt là cho các văn phòng nơi công sở, phòng ở khách sạn, cao ốc, phòng khách gia đình, thậm chí cho cả các phòng ngủ, nhà bếp….</p>

                        <p>&nbsp;</p>

                        <p>
                            Vì lẽ đó khi quý khách có nhu cầu về trang trí nội thất đặc biệt có nhu cầu về trang trí các loại rèm , mành , thảm , giấy dán tường ... hãy liên hệ đến&nbsp;DNTN PHỤ KIỆN MÀN RÈM CỬA LỘC HÀ, chúng tôi luôn sẵn sàng đáp ứng nhu cầu mà quý khách cần trong thời gian nhanh nhất.<br />
                            <br />
                            Đến với&nbsp;<strong>DNTN PHỤ KIỆN MÀN RÈM CỬA 24H</strong>&nbsp;quý khách sẽ cảm nhận được những bộ màn cửa, màn sáo được thiết kế một cách độc đáo, chuyên nghiệp mang phong cách hiện đại, sang trọng và lịch sự bên cạnh đó là sự đa dạng về chất liệu, màu sắc, kích thước với nhiều kiểu mẫu phù hợp với nhu cầu trang trí theo ý thích của quý khách.&nbsp;<br />
                            <br />
                            Ở&nbsp;<strong>DNTN PHỤ KIỆN MÀN RÈM CỬA 24G</strong>&nbsp;tinh thần hướng tới khách hàng luôn là tiêu chí để chúng tôi tồn tại và phát triển. Với phương châm “sự lựa chọn là nơi đặt niềm tin”<strong>&nbsp;</strong><strong>DNTN PHỤ KIỆN MÀN RÈM CỬA 24H</strong>&nbsp;không ngừng cải tiến phương thức hoạt động và chất lượng phục vụ để nâng cao khả năng cạnh tranh tập trung vào sự hài lòng của khách hàng nhằm giúp cho quý khách có được những sản phẩm không những tốt, bền, đẹp bên cạnh một mức giá hợp lý, cạnh tranh mà còn phù hợp với nhu cầu và mục đích sử dụng của qúy khách.&nbsp;<br />
                            &nbsp;
                        </p>

                        <p><strong><em>Hãy gọi điện thoại cho chung tôi .Quý khách sẽ được phục vụ nhiệt tình chu đáo mọi lúc mọi nơi.</em></strong></p>

                        <p>&nbsp;</p>

                        <h1><span style="color: #0099ff"><strong>DNTN 24H</strong></span></h1>

                        <p>Địa chỉ : 215 Thái Thị Bôi, Tp Đà Nẵng</p>

                        <p>Email : nguyenxuanloc1966@gmail.com</p>

                        <p>Website :&nbsp;<a href="http://phukienmancualocha.com/">www.remcua24h.com</a></p>

                        <p><strong>Hotline</strong>:&nbsp;<strong>0914 060 927 - 0935 918 327</strong></p>', N'', NULL, N'/uploadimages/anhgioithieu/25.png', NULL, N'Rèm cửa | rem-cua', N'Rèm cửa, rem-cua', N'Rèm cửa | rem-cua', N'', N'gioi-thieu/rem-cua-1')
SET IDENTITY_INSERT [dbo].[tbIntroduce] OFF
SET IDENTITY_INSERT [dbo].[tbNewCate] ON 

INSERT [dbo].[tbNewCate] ([newcate_id], [newcate_title], [newcate_summary], [hidden], [link_seo]) VALUES (9, N'Tin thị trường', N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbNewCate] OFF
SET IDENTITY_INSERT [dbo].[tbNews] ON 

INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (1, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN', N'eqewqeqw', N'/uploadimages/anhtintuc/qwyrubyz.rqw.png', N'Khi bạn ngồi trong nhà và nhìn ra ngoài cửa sổ, bạn nghĩ “cần phải trang trí tô điểm lại cửa sổ cho ngôi nhà thêm đẹp?”. Vậy phải làm thế nào nhỉ? Cửa sổ không chỉ để trang trí thẩm mỹ cho căn phòng. Ch&amp;u...', 1, 1, 1, N'tin-tuc/5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban-1', CAST(N'2019-11-14 14:12:21.587' AS DateTime), NULL, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN, 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (3, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN', N'', N'/images/2726517986_1569641717.jpg', N'Khi bạn ngồi trong nhà và nhìn ra ngoài cửa sổ, bạn nghĩ “cần phải trang trí tô điểm lại cửa sổ cho ngôi nhà thêm đẹp?”. Vậy phải làm thế nào nhỉ? Cửa sổ không chỉ để trang trí thẩm mỹ cho căn phòng. Ch&amp;u...', 1, 1, 1, N'tin-tuc/5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban-3', CAST(N'2019-11-14 14:12:21.663' AS DateTime), NULL, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN, 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (4, N'Màn rèm cửa ĐN - Mua rèm cửa đẹp', N'ưeqwe', N'/uploadimages/anhtintuc/23.png', N'ưewq', 1, 1, 1, N'tin-tuc/man-rem-cua-dn-mua-rem-cua-dep-0', CAST(N'2019-11-14 14:38:27.030' AS DateTime), NULL, N'Màn rèm cửa ĐN - Mua rèm cửa đẹp | man-rem-cua-dn-mua-rem-cua-dep', N'Màn rèm cửa ĐN - Mua rèm cửa đẹp, man-rem-cua-dn-mua-rem-cua-dep', N'Màn rèm cửa ĐN - Mua rèm cửa đẹp | man-rem-cua-dn-mua-rem-cua-dep', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (11, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN', N'eqewqeqw', N'/uploadimages/anhtintuc/qwyrubyz.rqw.png', N'Khi bạn ngồi trong nhà và nhìn ra ngoài cửa sổ, bạn nghĩ “cần phải trang trí tô điểm lại cửa sổ cho ngôi nhà thêm đẹp?”. Vậy phải làm thế nào nhỉ? Cửa sổ không chỉ để trang trí thẩm mỹ cho căn phòng. Ch&amp;u...', 1, 1, 1, N'tin-tuc/5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban-1', CAST(N'2019-11-19 14:41:09.980' AS DateTime), NULL, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', NULL)
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (12, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN', N'eqewqeqw', N'/uploadimages/anhtintuc/qwyrubyz.rqw.png', N'Khi bạn ngồi trong nhà và nhìn ra ngoài cửa sổ, bạn nghĩ “cần phải trang trí tô điểm lại cửa sổ cho ngôi nhà thêm đẹp?”. Vậy phải làm thế nào nhỉ? Cửa sổ không chỉ để trang trí thẩm mỹ cho căn phòng. Ch&amp;u...', 1, 1, 1, N'tin-tuc/5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban-1', NULL, NULL, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN | 5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (13, N'5 YẾU TỐ CẦN CÓ ĐỂ TRANG TRÍ LẠI CỬA SỔ NHÀ BẠN sdf sdf ', N'eqewqeqw sd sdf sd', N'/uploadimages/anhtintuc/qwyrubyz.rqw.png', N'Khi bạn ngồi trong nhà và nhìn ra ngoài cửa sổ, bạn nghĩ “cần phải trang trí tô điểm lại cửa sổ cho ngôi nhà thêm đẹp?”. Vậy phải làm thế nào nhỉ? Cửa sổ không chỉ để trang trí thẩm mỹ cho căn phòng sdfsd sdf sdf sdf sdf s sdfsdf s. Ch&amp;u...', 1, 1, 0, N'tin-tuc/5-yeu-to-can-co-de-trang-tri-lai-cua-so-nha-ban-1', CAST(N'2019-11-19 14:40:36.010' AS DateTime), NULL, N'Màn rèm cửa ĐN - Mua rèm cửa đẹp | man-rem-cua-dn-mua-rem-cua-dep', N'Màn rèm cửa ĐN - Mua rèm cửa đẹp | man-rem-cua-dn-mua-rem-cua-dep', N'Màn rèm cửa ĐN - Mua rèm cửa đẹp | man-rem-cua-dn-mua-rem-cua-dep', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (14, N'5 Yếu tố để chọn rèm cửa đẹp', N'5 Yếu tố để chọn rèm cửa đẹp', N'/uploadimages/anhtintuc/hqgbzlza.3ru.jpg', N'<div>5 Yếu tố để chọn rèm cửa đẹp sdfsdfsd sdf sdf sdf&nbsp;<div>5 Yếu tố để chọn rèm cửa đẹp</div></div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div><div>5 Yếu tố để chọn rèm cửa đẹp</div>', NULL, NULL, 1, N'tin-tuc/5-yeu-to-de-chon-rem-cua-dep-0', CAST(N'2019-11-19 14:43:54.970' AS DateTime), NULL, N'5 Yếu tố để chọn rèm cửa đẹp | 5-yeu-to-de-chon-rem-cua-dep', N'5 Yếu tố để chọn rèm cửa đẹp, 5-yeu-to-de-chon-rem-cua-dep', N'5 Yếu tố để chọn rèm cửa đẹp | 5-yeu-to-de-chon-rem-cua-dep', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (15, N'dsfsdvndjfvndjfnvkjn', N'sdjfnksjvinbskjvnk', N'/uploadimages/anhtintuc/w50czhtq.mtq.jfif', N'sdfgjdosfigj oidjfpogi djfgkl dsjfog iejr dnfgkjl dnfkljg df', NULL, NULL, 1, N'tin-tuc/dsfsdvndjfvndjfnvkjn-0', CAST(N'2019-11-19 14:43:38.217' AS DateTime), NULL, N'dsfsdvndjfvndjfnvkjn | dsfsdvndjfvndjfnvkjn', N'dsfsdvndjfvndjfnvkjn, dsfsdvndjfvndjfnvkjn', N'dsfsdvndjfvndjfnvkjn | dsfsdvndjfvndjfnvkjn', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (16, N'vbncvbnvbnvcbnvb', N'ncvbnvcbncvncvbncvbn', N'/uploadimages/anhtintuc/igboutye.5kt.jfif', N'xcjbklbjxbcvbkjnckbdsilubfjvxbzclkvkbzxjhvblsydgbflygbsdljvhcbx,mvbxjlvhbskjdbhvkjdfvdf', NULL, NULL, 1, N'tin-tuc/vbncvbnvbnvcbnvb-0', CAST(N'2019-11-19 15:10:52.600' AS DateTime), NULL, N'vbncvbnvbnvcbnvb | vbncvbnvbnvcbnvb', N'vbncvbnvbnvcbnvb, vbncvbnvbnvcbnvb', N'vbncvbnvbnvcbnvb | vbncvbnvbnvcbnvb', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (17, N'bvnvbncvbn', N'cvbnvcbncv', N'/uploadimages/anhtintuc/beu51nic.leu.png', N'bnfgnfgndfgn', NULL, NULL, 1, N'tin-tuc/bvnvbncvbn-0', CAST(N'2019-11-19 16:39:29.740' AS DateTime), NULL, N'bvnvbncvbn | bvnvbncvbn', N'bvnvbncvbn, bvnvbncvbn', N'bvnvbncvbn | bvnvbncvbn', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (18, N'bnhbvnmb,m.', N'm,.nm,.nm,.hjvhj', N'/uploadimages/anhtintuc/xutqo5gy.sde.png', N'vhkhjkghk', NULL, NULL, 1, N'tin-tuc/bnhbvnmb-m.-18', CAST(N'2019-11-19 16:46:21.337' AS DateTime), NULL, N'bnhbvnmb,m. | bnhbvnmb-m.', N'bnhbvnmb,m., bnhbvnmb-m.', N'bnhbvnmb,m. | bnhbvnmb-m.', N'')
INSERT [dbo].[tbNews] ([news_id], [news_title], [news_summary], [news_image], [news_content], [newcate_id], [hidden], [active], [link_seo], [news_datetime], [news_position], [meta_tittle], [meta_keywords], [meta_description], [meta_image]) VALUES (19, N'1', N'1', N'/uploadimages/anhtintuc/vfh2qys1.x44.jpg', N'1', NULL, NULL, 1, N'tin-tuc/1-0', CAST(N'2020-01-10 11:02:40.977' AS DateTime), NULL, N'1 | 1', N'1, 1', N'1 | 1', N'')
SET IDENTITY_INSERT [dbo].[tbNews] OFF
SET IDENTITY_INSERT [dbo].[tbProduct] ON 

INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200000, NULL, NULL, NULL, 1)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (32, NULL, N'Rèm vải 2 lớp phòng khách 01', N'/uploadimages/anhsanpham/pztcpaz1.eml.jpg', NULL, N'Nội dung cập nhật sau', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 01 | re-m-va-i-2-lo-p-pho-ng-kha-ch-01', N'Rèm vải 2 lớp phòng khách 01, re-m-va-i-2-lo-p-pho-ng-kha-ch-01', N'Rèm vải 2 lớp phòng khách 01 | re-m-va-i-2-lo-p-pho-ng-kha-ch-01', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-01-32', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 2)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (33, NULL, N'Rèm vải 2 lớp phòng khách 02', N'/uploadimages/anhsanpham/ryqus5ge.5n4.jpg', NULL, N'Nội dung cập nhật sau', NULL, 1, 1, 12, NULL, N'Rèm vải 2 lớp phòng khách 02 | re-m-va-i-2-lo-p-pho-ng-kha-ch-02', N'Rèm vải 2 lớp phòng khách 02, re-m-va-i-2-lo-p-pho-ng-kha-ch-02', N'Rèm vải 2 lớp phòng khách 02 | re-m-va-i-2-lo-p-pho-ng-kha-ch-02', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-02-33', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 3)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (34, NULL, N'Rèm vải 2 lớp phòng khách 03', N'/uploadimages/anhsanpham/1txe11hh.ru4.jpg', NULL, N'Nội dung cập nhật sau', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 03 | re-m-va-i-2-lo-p-pho-ng-kha-ch-03', N'Rèm vải 2 lớp phòng khách 03, re-m-va-i-2-lo-p-pho-ng-kha-ch-03', N'Rèm vải 2 lớp phòng khách 03 | re-m-va-i-2-lo-p-pho-ng-kha-ch-03', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-03-34', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 4)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (35, NULL, N'Rèm vải 2 lớp phòng khách 04', N'/uploadimages/anhsanpham/yjubxbjh.1uw.jpg', NULL, N'Nội dung cập nhật sau', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 04 | re-m-va-i-2-lo-p-pho-ng-kha-ch-04', N'Rèm vải 2 lớp phòng khách 04, re-m-va-i-2-lo-p-pho-ng-kha-ch-04', N'Rèm vải 2 lớp phòng khách 04 | re-m-va-i-2-lo-p-pho-ng-kha-ch-04', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-04-35', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 5)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (36, NULL, N'Rèm vải 2 lớp phòng khách 05', N'/uploadimages/anhsanpham/oplse3qi.vyj.jpg', NULL, N'Nội dung cập nhật sau<div id="gtx-trans" style="position: absolute; left: -39px; top: -13px;"><div class="gtx-trans-icon"></div></div>', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 05 | re-m-va-i-2-lo-p-pho-ng-kha-ch-05', N'Rèm vải 2 lớp phòng khách 05, re-m-va-i-2-lo-p-pho-ng-kha-ch-05', N'Rèm vải 2 lớp phòng khách 05 | re-m-va-i-2-lo-p-pho-ng-kha-ch-05', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-05-36', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 6)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (37, NULL, N'Rèm vải 2 lớp phòng khách 06', N'/uploadimages/anhsanpham/dgq5m4az.1yo.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 06 | re-m-va-i-2-lo-p-pho-ng-kha-ch-06', N'Rèm vải 2 lớp phòng khách 06, re-m-va-i-2-lo-p-pho-ng-kha-ch-06', N'Rèm vải 2 lớp phòng khách 06 | re-m-va-i-2-lo-p-pho-ng-kha-ch-06', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-06-37', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-14' AS Date), 7)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (38, NULL, N'Rèm vải 2 lớp phòng khách 07', N'/uploadimages/anhsanpham/gqz3lyng.0k3.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 07 | re-m-va-i-2-lo-p-pho-ng-kha-ch-07', N'Rèm vải 2 lớp phòng khách 07, re-m-va-i-2-lo-p-pho-ng-kha-ch-07', N'Rèm vải 2 lớp phòng khách 07 | re-m-va-i-2-lo-p-pho-ng-kha-ch-07', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-07-38', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 1)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (39, NULL, N'Rèm vải 2 lớp phòng khách 08', N'/uploadimages/anhsanpham/ywtencfz.zja.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 08 | re-m-va-i-2-lo-p-pho-ng-kha-ch-08', N'Rèm vải 2 lớp phòng khách 08, re-m-va-i-2-lo-p-pho-ng-kha-ch-08', N'Rèm vải 2 lớp phòng khách 08 | re-m-va-i-2-lo-p-pho-ng-kha-ch-08', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-08-39', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 2)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (40, NULL, N'Rèm vải 2 lớp phòng khách 09', N'/uploadimages/anhsanpham/kiiswmdy.4jr.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 09 | re-m-va-i-2-lo-p-pho-ng-kha-ch-09', N'Rèm vải 2 lớp phòng khách 09, re-m-va-i-2-lo-p-pho-ng-kha-ch-09', N'Rèm vải 2 lớp phòng khách 09 | re-m-va-i-2-lo-p-pho-ng-kha-ch-09', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-09-40', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 3)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (41, NULL, N'Rèm vải 2 lớp phòng khách 10', N'/uploadimages/anhsanpham/zsaxhztf.pkh.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 10 | re-m-va-i-2-lo-p-pho-ng-kha-ch-10', N'Rèm vải 2 lớp phòng khách 10, re-m-va-i-2-lo-p-pho-ng-kha-ch-10', N'Rèm vải 2 lớp phòng khách 10 | re-m-va-i-2-lo-p-pho-ng-kha-ch-10', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-10-41', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 4)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (42, NULL, N'Rèm vải 2 lớp phòng khách 11', N'/uploadimages/anhsanpham/mckx2duz.tjl.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 11 | re-m-va-i-2-lo-p-pho-ng-kha-ch-11', N'Rèm vải 2 lớp phòng khách 11, re-m-va-i-2-lo-p-pho-ng-kha-ch-11', N'Rèm vải 2 lớp phòng khách 11 | re-m-va-i-2-lo-p-pho-ng-kha-ch-11', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-11-42', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 5)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (43, NULL, N'Rèm vải 2 lớp phòng khách12', N'/uploadimages/anhsanpham/deayfloi.5rm.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách12 | re-m-va-i-2-lo-p-pho-ng-kha-ch12', N'Rèm vải 2 lớp phòng khách12, re-m-va-i-2-lo-p-pho-ng-kha-ch12', N'Rèm vải 2 lớp phòng khách12 | re-m-va-i-2-lo-p-pho-ng-kha-ch12', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch12-43', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 6)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (44, NULL, N'Rèm vải 2 lớp phòng khách 13', N'/uploadimages/anhsanpham/xyreaaoq.dsy.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 13 | re-m-va-i-2-lo-p-pho-ng-kha-ch-13', N'Rèm vải 2 lớp phòng khách 13, re-m-va-i-2-lo-p-pho-ng-kha-ch-13', N'Rèm vải 2 lớp phòng khách 13 | re-m-va-i-2-lo-p-pho-ng-kha-ch-13', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-13-44', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), 7)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (45, NULL, N'Rèm vải 2 lớp phòng khách 14', N'/uploadimages/anhsanpham/buezxwak.plq.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 14 | re-m-va-i-2-lo-p-pho-ng-kha-ch-14', N'Rèm vải 2 lớp phòng khách 14, re-m-va-i-2-lo-p-pho-ng-kha-ch-14', N'Rèm vải 2 lớp phòng khách 14 | re-m-va-i-2-lo-p-pho-ng-kha-ch-14', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-14-45', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (46, NULL, N'Rèm vải 2 lớp phòng khách 15', N'/uploadimages/anhsanpham/04juoqgx.0kf.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 15 | re-m-va-i-2-lo-p-pho-ng-kha-ch-15', N'Rèm vải 2 lớp phòng khách 15, re-m-va-i-2-lo-p-pho-ng-kha-ch-15', N'Rèm vải 2 lớp phòng khách 15 | re-m-va-i-2-lo-p-pho-ng-kha-ch-15', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-15-46', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (47, NULL, N'Rèm vải 2 lớp phòng khách 16', N'/uploadimages/anhsanpham/ikc2bg2i.xv0.jpg', NULL, N'<span style="background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;">Nội dung cập nhật sau</span>&nbsp;', NULL, 1, 1, 13, NULL, N'Rèm vải 2 lớp phòng khách 16 | re-m-va-i-2-lo-p-pho-ng-kha-ch-16', N'Rèm vải 2 lớp phòng khách 16, re-m-va-i-2-lo-p-pho-ng-kha-ch-16', N'Rèm vải 2 lớp phòng khách 16 | re-m-va-i-2-lo-p-pho-ng-kha-ch-16', NULL, N'san-pham/re-m-va-i-2-lo-p-pho-ng-kha-ch-16-47', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-14' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (48, NULL, N'Rèm vải cửa sổ 1', N'/uploadimages/1.jpg', NULL, N'<div>Rèm vải cửa sổ 1</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 1 | rem-vai-cua-so-1', N'Rèm vải cửa sổ 1, rem-vai-cua-so-1', N'Rèm vải cửa sổ 1 | rem-vai-cua-so-1', NULL, N'san-pham/rem-vai-cua-so-1-48', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (49, NULL, N'Rèm vải cửa sổ 2', N'/uploadimages/2.jpg', NULL, N'<div>Rèm vải cửa sổ 2</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 2 | rem-vai-cua-so-2', N'Rèm vải cửa sổ 2, rem-vai-cua-so-2', N'Rèm vải cửa sổ 2 | rem-vai-cua-so-2', NULL, N'san-pham/rem-vai-cua-so-2-49', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 1)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (50, NULL, N'Rèm vải cửa sổ 3', N'/uploadimages/3.jpg', NULL, N'<div>Rèm vải cửa sổ 3</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 3 | rem-vai-cua-so-3', N'Rèm vải cửa sổ 3, rem-vai-cua-so-3', N'Rèm vải cửa sổ 3 | rem-vai-cua-so-3', NULL, N'san-pham/rem-vai-cua-so-3-50', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 2)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (51, NULL, N'Rèm vải cửa sổ 4', N'/uploadimages/4.jpg', NULL, N'<div>Rèm vải cửa sổ 4</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 4 | rem-vai-cua-so-4', N'Rèm vải cửa sổ 4, rem-vai-cua-so-4', N'Rèm vải cửa sổ 4 | rem-vai-cua-so-4', NULL, N'san-pham/rem-vai-cua-so-4-51', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 3)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (52, NULL, N'Rèm vải cửa sổ 5', N'/uploadimages/5.jpg', NULL, N'<div>Rèm vải cửa sổ 5</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 5 | rem-vai-cua-so-5', N'Rèm vải cửa sổ 5, rem-vai-cua-so-5', N'Rèm vải cửa sổ 5 | rem-vai-cua-so-5', NULL, N'san-pham/rem-vai-cua-so-5-52', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 4)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (53, NULL, N'Rèm vải cửa sổ 6', N'/uploadimages/6.jpg', NULL, N'<div>Rèm vải cửa sổ 6</div>', NULL, 1, 1, 11, NULL, N'Rèm vải cửa sổ 6 | rem-vai-cua-so-6', N'Rèm vải cửa sổ 6, rem-vai-cua-so-6', N'Rèm vải cửa sổ 6 | rem-vai-cua-so-6', NULL, N'san-pham/rem-vai-cua-so-6-53', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 5)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (54, NULL, N'Rèm vải phòng ngủ 1', N'/uploadimages/anhsanpham/0luv1aym.fmv.jpg', NULL, N'<div>Rèm vải phòng ngủ 1</div>', NULL, 1, 1, 14, NULL, N'Rèm vải phòng ngủ 1 | rem-vai-phong-ngu-1', N'Rèm vải phòng ngủ 1, rem-vai-phong-ngu-1', N'Rèm vải phòng ngủ 1 | rem-vai-phong-ngu-1', NULL, N'san-pham/rem-vai-phong-ngu-1-54', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 6)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (55, NULL, N'Rèm vải phòng ngủ 2', N'/uploadimages/anhsanpham/bg5ndbsj.vuy.jfif', NULL, N'<div>Rèm vải phòng ngủ 2</div>', NULL, 1, 1, 14, NULL, N'Rèm vải phòng ngủ 2 | rem-vai-phong-ngu-2', N'Rèm vải phòng ngủ 2, rem-vai-phong-ngu-2', N'Rèm vải phòng ngủ 2 | rem-vai-phong-ngu-2', NULL, N'san-pham/rem-vai-phong-ngu-2-55', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 7)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (56, NULL, N'Rèm vải phòng ngủ 3', N'/uploadimages/anhsanpham/ctptcf04.j12.jfif', NULL, N'<div>Rèm vải phòng ngủ 3</div>', NULL, 1, 1, 14, NULL, N'Rèm vải phòng ngủ 3 | rem-vai-phong-ngu-3', N'Rèm vải phòng ngủ 3, rem-vai-phong-ngu-3', N'Rèm vải phòng ngủ 3 | rem-vai-phong-ngu-3', NULL, N'san-pham/rem-vai-phong-ngu-3-56', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), 8)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (57, NULL, N'Rèm vải phòng ngủ 4', N'/uploadimages/anhsanpham/nnus50z3.ysc.jfif', NULL, N'<div>Rèm vải phòng ngủ 4</div>', NULL, 1, 1, 14, NULL, N'Rèm vải phòng ngủ 4 | rem-vai-phong-ngu-4', N'Rèm vải phòng ngủ 4, rem-vai-phong-ngu-4', N'Rèm vải phòng ngủ 4 | rem-vai-phong-ngu-4', NULL, N'san-pham/rem-vai-phong-ngu-4-57', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (58, NULL, N'Rèm vải phòng ngủ 5', N'/uploadimages/anhsanpham/jflanmtk.wbu.jpg', NULL, N'<div>Rèm vải phòng ngủ 5</div>', NULL, 1, 1, 14, NULL, N'Rèm vải phòng ngủ 5 | rem-vai-phong-ngu-5', N'Rèm vải phòng ngủ 5, rem-vai-phong-ngu-5', N'Rèm vải phòng ngủ 5 | rem-vai-phong-ngu-5', NULL, N'san-pham/rem-vai-phong-ngu-5-58', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (59, NULL, N'Rèm vải khách sạn 1', N'/uploadimages/anhsanpham/ytnzyjdb.24z.jfif', NULL, N'<div>Rèm vải khách sạn 1</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 1 | rem-vai-khach-san-1', N'Rèm vải khách sạn 1, rem-vai-khach-san-1', N'Rèm vải khách sạn 1 | rem-vai-khach-san-1', NULL, N'san-pham/rem-vai-khach-san-1-59', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (60, NULL, N'Rèm vải khách sạn 2', N'/uploadimages/anhsanpham/kmye1l3h.d53.jfif', NULL, N'<div>Rèm vải khách sạn 2</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 2 | rem-vai-khach-san-2', N'Rèm vải khách sạn 2, rem-vai-khach-san-2', N'Rèm vải khách sạn 2 | rem-vai-khach-san-2', NULL, N'san-pham/rem-vai-khach-san-2-60', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (61, NULL, N'Rèm vải khách sạn 3', N'/uploadimages/anhsanpham/tjmapmll.niu.jpg', NULL, N'<div>Rèm vải khách sạn 3</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 3 | rem-vai-khach-san-3', N'Rèm vải khách sạn 3, rem-vai-khach-san-3', N'Rèm vải khách sạn 3 | rem-vai-khach-san-3', NULL, N'san-pham/rem-vai-khach-san-3-61', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (62, NULL, N'Rèm vải khách sạn 4', N'/uploadimages/anhsanpham/hq13ylb1.brz.jfif', NULL, N'<div>Rèm vải khách sạn 4</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 4 | rem-vai-khach-san-4', N'Rèm vải khách sạn 4, rem-vai-khach-san-4', N'Rèm vải khách sạn 4 | rem-vai-khach-san-4', NULL, N'san-pham/rem-vai-khach-san-4-62', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (63, NULL, N'Rèm vải khách sạn 5', N'/uploadimages/anhsanpham/kocdzlep.n15.png', NULL, N'<div>Rèm vải khách sạn 5</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 5 | rem-vai-khach-san-5', N'Rèm vải khách sạn 5, rem-vai-khach-san-5', N'Rèm vải khách sạn 5 | rem-vai-khach-san-5', NULL, N'san-pham/rem-vai-khach-san-5-63', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (64, NULL, N'Rèm vải khách sạn 6', N'/uploadimages/anhsanpham/sah1s4nh.2sw.jfif', NULL, N'<div>Rèm vải khách sạn 6</div>', NULL, 1, 1, 12, NULL, N'Rèm vải khách sạn 6 | rem-vai-khach-san-6', N'Rèm vải khách sạn 6, rem-vai-khach-san-6', N'Rèm vải khách sạn 6 | rem-vai-khach-san-6', NULL, N'san-pham/rem-vai-khach-san-6-64', NULL, NULL, N'', NULL, NULL, NULL, 340000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (65, NULL, N'Bố sọc trơn lớn 1', N'/uploadimages/anhsanpham/cyxafznb.jxy.png', NULL, N'<div>Bố sọc trơn lớn 1</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 1 | bo-soc-tron-lon-1', N'Bố sọc trơn lớn 1, bo-soc-tron-lon-1', N'Bố sọc trơn lớn 1 | bo-soc-tron-lon-1', NULL, N'san-pham/bo-soc-tron-lon-1-65', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (66, NULL, N'Bố sọc trơn lớn 2', N'/uploadimages/anhsanpham/gc3xjxgd.042.png', NULL, N'<div>Bố sọc trơn lớn 2</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 2 | bo-soc-tron-lon-2', N'Bố sọc trơn lớn 2, bo-soc-tron-lon-2', N'Bố sọc trơn lớn 2 | bo-soc-tron-lon-2', NULL, N'san-pham/bo-soc-tron-lon-2-66', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (67, NULL, N'Bố sọc trơn lớn 3', N'/uploadimages/anhsanpham/rai1cf4n.nfs.png', NULL, N'<div>Bố sọc trơn lớn 3</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 3 | bo-soc-tron-lon-3', N'Bố sọc trơn lớn 3, bo-soc-tron-lon-3', N'Bố sọc trơn lớn 3 | bo-soc-tron-lon-3', NULL, N'san-pham/bo-soc-tron-lon-3-67', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (68, NULL, N'Bố sọc trơn lớn 4', N'/uploadimages/anhsanpham/dvgiswso.ups.png', NULL, N'<div>Bố sọc trơn lớn 4</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 4 | bo-soc-tron-lon-4', N'Bố sọc trơn lớn 4, bo-soc-tron-lon-4', N'Bố sọc trơn lớn 4 | bo-soc-tron-lon-4', NULL, N'san-pham/bo-soc-tron-lon-4-68', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (69, NULL, N'Bố sọc trơn lớn 5', N'/uploadimages/anhsanpham/au5jwfyx.qlo.png', NULL, N'<div>Bố sọc trơn lớn 5</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 5 | bo-soc-tron-lon-5', N'Bố sọc trơn lớn 5, bo-soc-tron-lon-5', N'Bố sọc trơn lớn 5 | bo-soc-tron-lon-5', NULL, N'san-pham/bo-soc-tron-lon-5-69', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (70, NULL, N'Bố sọc trơn lớn 6', N'/uploadimages/anhsanpham/sr2tilju.gjn.png', NULL, N'<div>Bố sọc trơn lớn 6</div>', NULL, 1, 1, 6, NULL, N'Bố sọc trơn lớn 6 | bo-soc-tron-lon-6', N'Bố sọc trơn lớn 6, bo-soc-tron-lon-6', N'Bố sọc trơn lớn 6 | bo-soc-tron-lon-6', NULL, N'san-pham/bo-soc-tron-lon-6-70', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (71, NULL, N'Rèm vải spa 1', N'/uploadimages/anhsanpham/1jjkcedl.ds2.jfif', NULL, N'<div>Rèm vải spa 1</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 1 | rem-vai-spa-1', N'Rèm vải spa 1, rem-vai-spa-1', N'Rèm vải spa 1 | rem-vai-spa-1', NULL, N'san-pham/rem-vai-spa-1-71', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (72, NULL, N'Rèm vải spa 2', N'/uploadimages/anhsanpham/tmwbynzs.1ij.jfif', NULL, N'<div>Rèm vải spa 2</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 2 | rem-vai-spa-2', N'Rèm vải spa 2, rem-vai-spa-2', N'Rèm vải spa 2 | rem-vai-spa-2', NULL, N'san-pham/rem-vai-spa-2-72', NULL, NULL, N'', NULL, NULL, NULL, 370000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (73, NULL, N'Rèm vải spa 3', N'/uploadimages/anhsanpham/q2zwwoz5.r2q.jfif', NULL, N'<div>Rèm vải spa 3</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 3 | rem-vai-spa-3', N'Rèm vải spa 3, rem-vai-spa-3', N'Rèm vải spa 3 | rem-vai-spa-3', NULL, N'san-pham/rem-vai-spa-3-73', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (74, NULL, N'Rèm vải spa 4', N'/uploadimages/anhsanpham/4knylqbl.cmf.jfif', NULL, N'<div>Rèm vải spa 4</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 4 | rem-vai-spa-4', N'Rèm vải spa 4, rem-vai-spa-4', N'Rèm vải spa 4 | rem-vai-spa-4', NULL, N'san-pham/rem-vai-spa-4-74', NULL, NULL, N'', NULL, NULL, NULL, 370000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (75, NULL, N'Rèm vải spa 5', N'/uploadimages/anhsanpham/j45bmero.1vy.jfif', NULL, N'<div>Rèm vải spa 5</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 5 | rem-vai-spa-5', N'Rèm vải spa 5, rem-vai-spa-5', N'Rèm vải spa 5 | rem-vai-spa-5', NULL, N'san-pham/rem-vai-spa-5-75', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (76, NULL, N'Rèm vải spa 6', N'/uploadimages/anhsanpham/4gcptmmk.4kl.jpg', NULL, N'<div>Rèm vải spa 6</div>', NULL, 1, 1, 15, NULL, N'Rèm vải spa 4 | rem-vai-spa-4', N'Rèm vải spa 4, rem-vai-spa-4', N'Rèm vải spa 4 | rem-vai-spa-4', NULL, N'san-pham/rem-vai-spa-4-76', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (77, NULL, N'Rèm vải voan 1', N'/uploadimages/anhsanpham/fvirckdv.jvj.jfif', NULL, N'<div>Rèm vải voan 1</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 1 | rem-vai-voan-1', N'Rèm vải voan 1, rem-vai-voan-1', N'Rèm vải voan 1 | rem-vai-voan-1', NULL, N'san-pham/rem-vai-voan-1-77', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (78, NULL, N'Rèm vải voan 2', N'/uploadimages/anhsanpham/trkji2ua.zha.jfif', NULL, N'<div>Rèm vải voan 2</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 2 | rem-vai-voan-2', N'Rèm vải voan 2, rem-vai-voan-2', N'Rèm vải voan 2 | rem-vai-voan-2', NULL, N'san-pham/rem-vai-voan-2-78', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (79, NULL, N'Rèm vải voan 3', N'/uploadimages/anhsanpham/vay2rqhn.kxw.jfif', NULL, N'<div>Rèm vải voan 3</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 3 | rem-vai-voan-3', N'Rèm vải voan 3, rem-vai-voan-3', N'Rèm vải voan 3 | rem-vai-voan-3', NULL, N'san-pham/rem-vai-voan-3-79', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (80, NULL, N'Rèm vải voan 4', N'/uploadimages/anhsanpham/3osbse15.xwa.jfif', NULL, N'<div>Rèm vải voan 1</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 4 | rem-vai-voan-4', N'Rèm vải voan 4, rem-vai-voan-4', N'Rèm vải voan 4 | rem-vai-voan-4', NULL, N'san-pham/rem-vai-voan-4-80', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (81, NULL, N'Rèm vải voan 5', N'/uploadimages/anhsanpham/5gqff1o1.st1.jfif', NULL, N'<div>Rèm vải voan 5</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 5 | rem-vai-voan-5', N'Rèm vải voan 5, rem-vai-voan-5', N'Rèm vải voan 5 | rem-vai-voan-5', NULL, N'san-pham/rem-vai-voan-5-81', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (82, NULL, N'Rèm vải voan 6', N'/uploadimages/anhsanpham/5vbglnnq.140.jfif', NULL, N'<div>Rèm vải voan 6</div>', NULL, 1, 1, 17, NULL, N'Rèm vải voan 6 | rem-vai-voan-6', N'Rèm vải voan 6, rem-vai-voan-6', N'Rèm vải voan 6 | rem-vai-voan-6', NULL, N'san-pham/rem-vai-voan-6-82', NULL, NULL, N'', NULL, NULL, NULL, 310000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (83, NULL, N'Rèm cuốn văn phòng 1', N'/uploadimages/anhsanpham/i4omofc5.yo3.jfif', NULL, N'<div>Rèm cuốn văn phòng 1</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 1 | rem-cuon-van-phong-1', N'Rèm cuốn văn phòng 1, rem-cuon-van-phong-1', N'Rèm cuốn văn phòng 1 | rem-cuon-van-phong-1', NULL, N'san-pham/rem-cuon-van-phong-1-83', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (84, NULL, N'Rèm cuốn văn phòng 2', N'/uploadimages/anhsanpham/fnocz2zz.mc1.jfif', NULL, N'<div>Rèm cuốn văn phòng 2</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 2 | rem-cuon-van-phong-2', N'Rèm cuốn văn phòng 2, rem-cuon-van-phong-2', N'Rèm cuốn văn phòng 2 | rem-cuon-van-phong-2', NULL, N'san-pham/rem-cuon-van-phong-2-84', NULL, NULL, N'', NULL, NULL, NULL, 310000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (85, NULL, N'Rèm cuốn văn phòng 3', N'/uploadimages/anhsanpham/uos3xema.bo1.jfif', NULL, N'<div>Rèm cuốn văn phòng 3</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 3 | rem-cuon-van-phong-3', N'Rèm cuốn văn phòng 3, rem-cuon-van-phong-3', N'Rèm cuốn văn phòng 3 | rem-cuon-van-phong-3', NULL, N'san-pham/rem-cuon-van-phong-3-85', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (86, NULL, N'Rèm cuốn văn phòng 4', N'/uploadimages/anhsanpham/vkmnx2or.say.jfif', NULL, N'<div>Rèm cuốn văn phòng 4</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 4 | rem-cuon-van-phong-4', N'Rèm cuốn văn phòng 4, rem-cuon-van-phong-4', N'Rèm cuốn văn phòng 4 | rem-cuon-van-phong-4', NULL, N'san-pham/rem-cuon-van-phong-4-86', NULL, NULL, N'', NULL, NULL, NULL, 230000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (87, NULL, N'Rèm cuốn văn phòng 5', N'/uploadimages/anhsanpham/nk3ywtxv.fai.jfif', NULL, N'<div>Rèm cuốn văn phòng 5</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 5 | rem-cuon-van-phong-5', N'Rèm cuốn văn phòng 5, rem-cuon-van-phong-5', N'Rèm cuốn văn phòng 5 | rem-cuon-van-phong-5', NULL, N'san-pham/rem-cuon-van-phong-5-87', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (88, NULL, N'Rèm cuốn văn phòng 6', N'/uploadimages/anhsanpham/nybbneaf.b0y.jfif', NULL, N'<div>Rèm cuốn văn phòng 6</div>', NULL, 1, 1, 7, NULL, N'Rèm cuốn văn phòng 6 | rem-cuon-van-phong-6', N'Rèm cuốn văn phòng 6, rem-cuon-van-phong-6', N'Rèm cuốn văn phòng 6 | rem-cuon-van-phong-6', NULL, N'san-pham/rem-cuon-van-phong-6-88', NULL, NULL, N'', NULL, NULL, NULL, 370000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (89, NULL, N'Rèm cuốn tranh 1', N'/uploadimages/1.jpg', NULL, N'<div><div>&nbsp;Rèm cuốn tranh 1</div></div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 1 | rem-cuon-tranh-1', N'Rèm cuốn tranh 1, rem-cuon-tranh-1', N'Rèm cuốn tranh 1 | rem-cuon-tranh-1', NULL, N'san-pham/rem-cuon-tranh-1-89', NULL, NULL, N'', NULL, NULL, NULL, 310000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (90, NULL, N'Rèm cuốn tranh 2', N'/uploadimages/2.jpg', NULL, N'<div>Rèm cuốn tranh 2</div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 2 | rem-cuon-tranh-2', N'Rèm cuốn tranh 2, rem-cuon-tranh-2', N'Rèm cuốn tranh 2 | rem-cuon-tranh-2', NULL, N'san-pham/rem-cuon-tranh-2-90', NULL, NULL, N'', NULL, NULL, NULL, 110000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (91, NULL, N'Rèm cuốn tranh 3', N'/uploadimages/3.jpg', NULL, N'<div>Rèm cuốn tranh 3</div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 3 | rem-cuon-tranh-3', N'Rèm cuốn tranh 3, rem-cuon-tranh-3', N'Rèm cuốn tranh 3 | rem-cuon-tranh-3', NULL, N'san-pham/rem-cuon-tranh-3-91', NULL, NULL, N'', NULL, NULL, NULL, 200000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (92, NULL, N'Rèm cuốn tranh 4', N'/uploadimages/4.jpg', NULL, N'<div>Rèm cuốn tranh 4</div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 4 | rem-cuon-tranh-4', N'Rèm cuốn tranh 4, rem-cuon-tranh-4', N'Rèm cuốn tranh 4 | rem-cuon-tranh-4', NULL, N'san-pham/rem-cuon-tranh-4-92', NULL, NULL, N'', NULL, NULL, NULL, 130000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (93, NULL, N'Rèm cuốn tranh 5', N'/uploadimages/5.jpg', NULL, N'<div>Rèm cuốn tranh 5</div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 5 | rem-cuon-tranh-5', N'Rèm cuốn tranh 5, rem-cuon-tranh-5', N'Rèm cuốn tranh 5 | rem-cuon-tranh-5', NULL, N'san-pham/rem-cuon-tranh-5-93', NULL, NULL, N'', NULL, NULL, NULL, 115000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (94, NULL, N'Rèm cuốn tranh 6', N'/uploadimages/6.jpg', NULL, N'<div>Rèm cuốn tranh 6</div>', NULL, 1, 1, 8, NULL, N'Rèm cuốn tranh 6 | rem-cuon-tranh-6', N'Rèm cuốn tranh 6, rem-cuon-tranh-6', N'Rèm cuốn tranh 6 | rem-cuon-tranh-6', NULL, N'san-pham/rem-cuon-tranh-6-94', NULL, NULL, N'', NULL, NULL, NULL, 100000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
INSERT [dbo].[tbProduct] ([product_id], [product_position], [product_title], [product_image], [product_summary], [product_content], [product_quantum], [product_show], [product_new], [productcate_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [product_chungloai], [thuonghieu_id], [meta_image], [product_representative], [product_cart], [product_price_new], [product_price], [product_promotions], [product_price_entry], [product_date], [color_id]) VALUES (95, NULL, N'Rèm lá dọc 123', N'/uploadimages/7.jpg', NULL, N'<div>Rèm lá dọc 123</div>', NULL, 1, 1, 3, NULL, N'Rèm lá dọc 123 | rem-la-doc-123', N'Rèm lá dọc 123, rem-la-doc-123', N'Rèm lá dọc 123 | rem-la-doc-123', NULL, N'san-pham/rem-la-doc-123-95', NULL, NULL, N'', NULL, NULL, NULL, 100000, NULL, NULL, CAST(N'2019-11-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[tbProduct] OFF
SET IDENTITY_INSERT [dbo].[tbProductCate] ON 

INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (1, 1, N'RÈM VẢI', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-vai-1', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon1.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (2, 2, N'RÈM CUỐN', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-cuon-2', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon7.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (3, 3, N'RÈM LÁ DỌC', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-la-doc/rem-la-doc-3', 0, NULL, N'images/banner.jpg', N'images/icon/icon-7.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (4, 4, N'RÈM GỖ', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-go/rem-go-4', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon3.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (5, 5, N'RÈM NHÔM', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-nhom/rem-nhom-5', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon4.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (7, NULL, N'Rèm cuốn văn phòng', 1, NULL, NULL, N'Rèm cuốn văn phòng', N'Rèm cuốn văn phòng', N'Bố sọc trơn nhỏ | bo-soc-tron-nho', NULL, N'rem-cuon/rem-cuon-van-phong-7', 2, NULL, N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (8, NULL, N'Rèm cuốn tranh', 1, NULL, NULL, N'Rèm cuốn tranh', N'Rèm cuốn tranh', N'Vãi thố nhỏ | vai-tho-nho', NULL, N'rem-cuon/rem-cuon-tranh-8', 2, NULL, N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (9, NULL, N'RÈM CẦU VỒNG', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-cau-vong-9', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon6.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (10, NULL, N'Rèm cuốn cửa sổ', 1, NULL, NULL, N'Rèm cuốn cửa sổ', N'Rèm cuốn cửa sổ, ', N'Rèm  lá dọc dọc | rem-la-doc-doc', NULL, N'rem-cuon/rem-cuon-cua-so-10', 2, NULL, N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (11, 4, N'Rèm vải cửa sổ', 1, NULL, NULL, N'Rèm vải cửa sổ | rem-vai-cua-so', N'Rèm vải cửa sổ, rem-vai-cua-so', N'Rèm vải cửa sổ', NULL, N'rem-vai/rem-vai-cua-so-11', 1, N'', N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (12, 3, N'Rèm vải trang trí', 1, NULL, NULL, N'Rèm vải trang trí đẹp, rèm vải trang trí giá rẻ', N'Rèm vải trang trí đẹp', N'Rèm vải trang trí đẹp, giá rẻ', NULL, N'rem-vai/rem-vai-trang-tri-12', 1, N'', N'', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (13, 1, N'Rèm vải phòng khách', 1, NULL, NULL, N'Rèm vải phòng khách', N'Rèm vải phòng khách', N'Rèm vải phòng khách | re-m-va-i-pho-ng-kha-ch', NULL, N'rem-vai/rem-vai-phong-khach-13', 1, N'', N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (14, 2, N'Rèm vải phòng ngủ', 1, NULL, NULL, N'Rèm vải phòng ngủ', N'Rèm vải phòng ngủ', N'Rèm vải phòng ngủ | re-m-va-i-pho-ng-ngu-', NULL, N'rem-vai/rem-vai-phong-ngu-14', 1, N'', N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (15, 5, N'Rèm vải spa và cửa hàng', 1, NULL, NULL, N'Rèm vải spa | re-m-va-i-spa', N'Rèm vải spa, re-m-va-i-spa', N'Rèm vải spa | re-m-va-i-spa', NULL, N'tin-tuc/re-m-va-i-spa-15', 1, N'', N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (17, 7, N'Rèm vải voan', 1, NULL, NULL, N'Rèm vải voan', N'Rèm vải voan', N'Rèm vải voan | re-m-va-i-voan', NULL, N'rem-vai/rem-vai-voan-17', 1, N'', N'images/banner.jpg', NULL)
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (18, NULL, N'RÈM TRE', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-tre/rem-tre-18', 0, NULL, N'images/banner.jpg', N'images/icon/icon-7.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (19, NULL, N'RÈM NHỰA PVC', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-nhua-pvc/rem-nhua-pvc-19', 0, NULL, N'images/banner.jpg', N'images/icon/remcua-icon8.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (20, NULL, N'RÈM ROMAN', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'rem-roman/rem-roman-20', 0, NULL, NULL, N'images/icon/remcua-icon9.png')
INSERT [dbo].[tbProductCate] ([productcate_id], [productcate_position], [productcate_title], [productcate_show], [productgroup_id], [title_web], [meta_title], [meta_keywords], [meta_description], [h1_seo], [link_seo], [productcate_parent], [productcate_content], [meta_image], [produtcate_icon]) VALUES (22, 6, N'Rèm vài khách sạn', 1, NULL, NULL, N'Rèm vài khách sạn | re-m-va-i-kha-ch-sa-n', N'Rèm vài khách sạn, re-m-va-i-kha-ch-sa-n', N'Rèm vài khách sạn | re-m-va-i-kha-ch-sa-n', NULL, N'rem-vai/re-m-va-i-kha-ch-sa-n-22', 1, N'Nội dung test abc', N'', NULL)
SET IDENTITY_INSERT [dbo].[tbProductCate] OFF
SET IDENTITY_INSERT [dbo].[tbSlide] ON 

INSERT [dbo].[tbSlide] ([slide_id], [slide_image], [slide_title], [slide_title1], [slide_link], [slide_summary], [slide_content], [hidden], [slide_date]) VALUES (1, N'/uploadimages/anhslide/otkhnoqs.lph.jpg', N'd gqgf', NULL, N'nfdfguq', NULL, NULL, 1, CAST(N'2019-11-19' AS Date))
INSERT [dbo].[tbSlide] ([slide_id], [slide_image], [slide_title], [slide_title1], [slide_link], [slide_summary], [slide_content], [hidden], [slide_date]) VALUES (2, N'/uploadimages/anhslide/2(1).jpg', N'd gqgf', NULL, N'nfdfguq', NULL, NULL, 1, CAST(N'2019-11-19' AS Date))
INSERT [dbo].[tbSlide] ([slide_id], [slide_image], [slide_title], [slide_title1], [slide_link], [slide_summary], [slide_content], [hidden], [slide_date]) VALUES (3, N'/uploadimages/anhslide/tcgstl5j.3ca.jpg', N'Rèm Cửa 24h', NULL, N'ads', NULL, NULL, 1, CAST(N'2019-11-19' AS Date))
SET IDENTITY_INSERT [dbo].[tbSlide] OFF
SET IDENTITY_INSERT [sum35047_remcua].[tbColor] ON 

INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (1, N'Đỏ')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (2, N'Vàng')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (3, N'Xanh Lam')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (4, N'Xanh Lá')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (5, N'Tím')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (6, N'Hồng')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (7, N'Đen')
INSERT [sum35047_remcua].[tbColor] ([color_id], [color_name]) VALUES (8, N'Trắng')
SET IDENTITY_INSERT [sum35047_remcua].[tbColor] OFF
SET IDENTITY_INSERT [sum35047_remcua].[tbContact] ON 

INSERT [sum35047_remcua].[tbContact] ([contact_id], [contact_address], [contact_email], [contact_link], [contact_hotline], [contact_name]) VALUES (1, N'195 Lê Thanh Nghị, Tp Đà Nẵng', N'luuvanquyet2612@gmail.com', N'www.remcua24h.com', N'0914 060 927 - 0935 918 328', N'RÈM CỬA 24H')
SET IDENTITY_INSERT [sum35047_remcua].[tbContact] OFF
SET IDENTITY_INSERT [sum35047_remcua].[tbCustomer] ON 

INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (1, N'Lưu Văn Quyết', N'luuvanquyet2612@gmail.com', N'0702406546', N'mua rèm cửa.....', CAST(N'2019-11-08 11:02:00.080' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (2, N'Lưu Văn Quyết', N'luuvanquyet2612@gmail.com', N'0702406546', N'mua rèm cửa.....', CAST(N'2019-11-08 11:05:35.843' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (3, N'Lưu Văn Quyết 2', N'luuvanquyet2612@gmail.com', N'0702406546', N'mua rèm cửa.....', CAST(N'2019-11-08 11:06:02.660' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (4, N'sdfsdf', N'sdfsdf', N'sdfsdf', N'fsfds', CAST(N'2019-11-10 20:55:15.903' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (5, N'sdfsdf', N'sdfsdf', N'sdfsdf', N'fsfds', CAST(N'2019-11-10 20:58:05.380' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (6, N'cvxcv', N'xcvxcv', N'xcvxcvxc', N'vxcvxc', CAST(N'2019-11-10 22:03:09.807' AS DateTime), 1)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (7, N'Lưu Văn Quyết', N'quyet@mail.com', N'', N'', CAST(N'2019-11-19 18:15:36.710' AS DateTime), 0)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (8, N'Lưu Văn Quyết', N'quyet@mail.com', N'', N'', CAST(N'2019-11-19 18:15:37.200' AS DateTime), 0)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (9, N'Lưu Văn Quyết', N'quyet@mail.com', N'êqertewrwq', N'ừvf', CAST(N'2019-11-19 18:19:11.630' AS DateTime), 0)
INSERT [sum35047_remcua].[tbCustomer] ([cus_id], [cus_name], [cus_email], [cus_phone], [cus_content], [cus_date], [cus_active]) VALUES (10, N'Lưu Văn Quyết', N'quyet@mail.com', N'êqertewrwq', N'ừvf', CAST(N'2019-11-19 18:19:12.213' AS DateTime), 0)
SET IDENTITY_INSERT [sum35047_remcua].[tbCustomer] OFF
SET IDENTITY_INSERT [sum35047_remcua].[tbDangKyEmail] ON 

INSERT [sum35047_remcua].[tbDangKyEmail] ([dke_id], [dke_email], [dke_tinhtrang]) VALUES (1, N'nguyendaimaitien@gmail.com', N'Đã xem')
INSERT [sum35047_remcua].[tbDangKyEmail] ([dke_id], [dke_email], [dke_tinhtrang]) VALUES (2, N'nguyendaimaitien@gmail.com', N'Đã xem')
INSERT [sum35047_remcua].[tbDangKyEmail] ([dke_id], [dke_email], [dke_tinhtrang]) VALUES (3, N'luuvanquyet2612@gmail.com', N'Đã xem')
INSERT [sum35047_remcua].[tbDangKyEmail] ([dke_id], [dke_email], [dke_tinhtrang]) VALUES (4, N'', N'Đã xem')
SET IDENTITY_INSERT [sum35047_remcua].[tbDangKyEmail] OFF
SET IDENTITY_INSERT [sum35047_remcua].[tbOrder] ON 

INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (1, N'hhhah', N'Hiên', NULL, N'Văn Cận', CAST(N'2019-11-10' AS Date), NULL, N'Tội cần mua...', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (2, N'hhhah', N'Hiên', NULL, N'Văn Cận', CAST(N'2019-11-10' AS Date), NULL, N'Tội cần mua...', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (3, N'hhhah', N'', NULL, N'', CAST(N'2019-11-10' AS Date), NULL, N'', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (4, N'hhhah', N'dd', NULL, N'fffd', CAST(N'2019-11-10' AS Date), NULL, N'dđ', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (5, N'hhhah', N'fsdfsd', NULL, N'', CAST(N'2019-11-10' AS Date), NULL, N'', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (6, N'fffffff', N'fdgdfg', NULL, N'dfgdf', CAST(N'2019-11-10' AS Date), NULL, N'gdfg', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (7, N'hhhhh', N'nfjdnfhb`1dshb', NULL, N'bdfhihwbe1bwdfb1', CAST(N'2019-11-11' AS Date), NULL, N'dsbhfuwefwe', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (8, N'Bố sọc trơn lớn 4', N'Hiên', NULL, N'Văn Cận', CAST(N'2019-11-16' AS Date), NULL, N'sdfsdfsdf', NULL, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (9, N'Bố sọc trơn lớn 4', N'Hiên', NULL, N'sdfsdfxcvbxcv', CAST(N'2019-11-16' AS Date), NULL, N'cvbxcvbxcvbxcvbcxvbxcv', 5, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (10, N'Bố sọc trơn lớn 5', N'Lưu Văn Quyết', NULL, N'Đà Nẵng', CAST(N'2019-11-16' AS Date), N'0123456789', N'Mua
', 10, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (11, N'Bố sọc trơn lớn 4', N'vbnvcbn', NULL, N'cvbnvb', CAST(N'2019-11-18' AS Date), N'cvbnvbn', N'vbcnvb', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (12, N'Bố sọc trơn lớn 4', N'vbnvcbn', NULL, N'cvbnvb', CAST(N'2019-11-18' AS Date), N'cvbnvbn', N'vbcnvb', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (13, N'Rèm cuốn văn phòng 4', N'Hiên', NULL, N'sdfsdljnvkcxjnvkxj', CAST(N'2019-11-18' AS Date), N'04651321654', N'xcv mxncbvzmcxvx', 0, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (14, N'Bố sọc trơn lớn 3', N'  bvmbvnmvbnm', NULL, N'dfghdfgh', CAST(N'2019-11-18' AS Date), N'453456345', N'bcnbcvncvncvb', 3, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (15, N'Bố sọc trơn lớn 3', N'vbnmvbnm', NULL, N'gjghj', CAST(N'2019-11-18' AS Date), N'546546', N'vb,bn,mbnm', 4, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (16, N'Bố sọc trơn lớn 3', N'vbnmvbnm', NULL, N'gjghj', CAST(N'2019-11-18' AS Date), N'546546', N'vb,bn,mbnm', 7, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (17, N'Bố sọc trơn lớn 3', N'mn,mn.', NULL, N'ffghdfnv', CAST(N'2019-11-18' AS Date), N'45646545', N'ncvnvbnv', 3, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (18, N'Bố sọc trơn lớn 3', N'mn,mn.', NULL, N'ffghdfnv', CAST(N'2019-11-18' AS Date), N'45646545', N'ncvnvbnv', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (19, N'Rèm vải cửa sổ 5', N'Nguyễn Văn hIên', NULL, N'01 Văn cận, cẩm lệ, đà nẵng', CAST(N'2019-11-18' AS Date), N'0399086621', N'tôi muốn mua rèm cửa', 4, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (20, N'Bố sọc trơn lớn 4', N'Nguyễn Văn HIên ', NULL, N'Văn Cận', CAST(N'2019-11-19' AS Date), N'0399084651', N'Mua Rèm Nhoa', 4, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (21, N'Bố sọc trơn lớn 3', N'nguye nvan ưhien', NULL, N'dfjdlknbld', CAST(N'2019-11-19' AS Date), N'0216513', N'dfjglkdnblkcv', 1, 1)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (22, N'Bố sọc trơn lớn 6', N'quyetws', NULL, N'đaadaf', CAST(N'2019-11-19' AS Date), N'23861237516', N'davdqws', 2, 0)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (23, N'Bố sọc trơn lớn 6', N'qeqweqw', NULL, N'53412312', CAST(N'2019-11-19' AS Date), N'223123', N'y635324', 2, 0)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (24, N'Rèm vải voan 4', N'hvh', NULL, N'h.vanhieu1999@gmail.com', CAST(N'2020-03-25' AS Date), N'0905732986', N'qtteqtert', 1, 0)
INSERT [sum35047_remcua].[tbOrder] ([order_id], [order_product], [order_custumer], [order_email], [order_address], [order_date], [order_phone], [order_content], [order_amount], [order_active]) VALUES (25, N'Rèm cuốn văn phòng 2', N'Luu van quyet', NULL, N'dn', CAST(N'2022-03-23' AS Date), N'0334798366', N'avdba', 2, 1)
SET IDENTITY_INSERT [sum35047_remcua].[tbOrder] OFF
ALTER TABLE [dbo].[admin_AccessGroupUserForm]  WITH CHECK ADD FOREIGN KEY([form_id])
REFERENCES [dbo].[admin_Form] ([form_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserForm]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserModule]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessGroupUserModule]  WITH CHECK ADD FOREIGN KEY([module_id])
REFERENCES [dbo].[admin_Module] ([module_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessUserForm]  WITH CHECK ADD FOREIGN KEY([form_id])
REFERENCES [dbo].[admin_Form] ([form_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_AccessUserForm]  WITH CHECK ADD FOREIGN KEY([username_id])
REFERENCES [dbo].[admin_User] ([username_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_Form]  WITH CHECK ADD FOREIGN KEY([module_id])
REFERENCES [dbo].[admin_Module] ([module_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[admin_User]  WITH CHECK ADD FOREIGN KEY([groupuser_id])
REFERENCES [dbo].[admin_GroupUser] ([groupuser_id])
ON UPDATE CASCADE
GO
