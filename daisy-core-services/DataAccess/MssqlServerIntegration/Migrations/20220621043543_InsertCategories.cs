using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class InsertCategories : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"
				INSERT INTO [dbo].[Categories]
						   ([Description]
						   ,[Name]
						   ,[CreatedAt]
						   ,[UpdatedAt]
						   ,[DeletedAt]
						   ,[ObjectId]
						   ,[Type])
					 VALUES
						   (null, N'Nhận diện thương hiệu', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   (null, N'Logo', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Nhận diện thương hiệu'),
						   (null, N'Danh thiếp', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Nhận diện thương hiệu'),
						   (null, N'Catalog', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Nhận diện thương hiệu'),
						   (null, N'Tờ rơi', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Nhận diện thương hiệu'),
						   ('UI', N'Thiết kế giao diện người dùng', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   (null, N'Giao diện website', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế giao diện người dùng'),
						   (null, N'Giao diện game', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế giao diện người dùng'),
						   (null, N'Giao diện ứng dụng điện thoại', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế giao diện người dùng'),
						   (null, N'Ấn phẩm in ấn', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   ('Poster', N'Áp phích', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Ấn phẩm in ấn'),
						   ('Banner', N'Bảng quảng cáo', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Ấn phẩm in ấn'),
						   ('Backdrop', N'Phông nền sân khấu', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Ấn phẩm in ấn'),
						   (null, N'Thiết kế không gian', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   (null, N'Bảng chỉ dẫn', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế không gian'),
						   (null, N'Nội thất', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế không gian'),
						   (null, N'Không gian tổ chức sự kiện', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế không gian'),
						   (null, N'Thiết kế đồ họa', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   ('Motion graphic', N'Đồ họa chuyển động', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế đồ họa'),
						   (null, N'Vẽ minh họa', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế đồ họa'),
						   (null, N'Nhân vật', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế đồ họa'),
						   (null, N'Thiết kế 3D', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế đồ họa'),
						   (null, N'Thiết kế thời trang', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   (null, N'Trang phục', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế thời trang'),
						   (null, N'Phụ kiện', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế thời trang'),
						   (null, N'Trang sức', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế thời trang'),
						   (null, N'Hoa văn vải', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế thời trang'),
						   (null, N'Thiết kế công nghiệp', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), 'Parent'),
						   (null, N'Nhãn dán', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế công nghiệp'),
						   (null, N'Bìa sách', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế công nghiệp'),
						   (null, N'Bao bì', CURRENT_TIMESTAMP, null, null, (SELECT NEWID()), N'Thiết kế công nghiệp');

				INSERT INTO [dbo].[CategoryCategory]
						   ([ParentCategoryId]
						   ,[ChildrenCategoryId])
 
						   (SELECT Parent.Id AS ParentCategoryId, Children.Id AS ChildrenCategoryId FROM CATEGORIES AS Parent
							INNER JOIN CATEGORIES AS Children
							ON Children.[Type] = Parent.[Name]
							WHERE Parent.[Type] = 'Parent');");
		}

        protected override void Down(MigrationBuilder migrationBuilder)
        {
		}
    }
}
