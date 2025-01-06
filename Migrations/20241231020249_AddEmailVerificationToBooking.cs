using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebKhachSan.Migrations
{
    /// <inheritdoc />
    public partial class AddEmailVerificationToBooking : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "EmailVerificationToken",
                table: "Bookings",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<bool>(
                name: "IsEmailVerified",
                table: "Bookings",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EmailVerificationToken",
                table: "Bookings");

            migrationBuilder.DropColumn(
                name: "IsEmailVerified",
                table: "Bookings");
        }
    }
}
