ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_count] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[count] ([Code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_count]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_tour]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tour] ([id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_tour]
GO
ALTER TABLE [dbo].[TupeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTour_tupe] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tupe] ([id])
GO
ALTER TABLE [dbo].[TupeOfTour] CHECK CONSTRAINT [FK_TupeOfTour_tupe]
GO
USE [master]
GO
ALTER DATABASE [kamilla] SET  READ_WRITE 
GO
