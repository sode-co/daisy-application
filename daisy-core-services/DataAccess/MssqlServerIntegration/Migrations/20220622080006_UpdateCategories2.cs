using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.MssqlServerIntegration.Migrations
{
    public partial class UpdateCategories2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
             migrationBuilder.Sql(@"
				UPDATE Categories
                    SET [Type] = 'Parent'
                    WHERE [Type] = '';

                    UPDATE Categories
                    SET [Type] = N'Thiết kế thời trang'
                    WHERE [Type] = 'Parent' AND [Name] = N'Trang phục';

                    TRUNCATE TABLE CategoryCategory;

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
