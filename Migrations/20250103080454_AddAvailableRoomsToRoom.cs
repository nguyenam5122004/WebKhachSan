﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebKhachSan.Migrations
{
    /// <inheritdoc />
    public partial class AddAvailableRoomsToRoom : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AvailableRooms",
                table: "Rooms",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AvailableRooms",
                table: "Rooms");
        }
    }
}
