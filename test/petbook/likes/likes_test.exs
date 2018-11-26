defmodule Petbook.LikesTest do
  use Petbook.DataCase

  alias Petbook.Likes

  describe "likes" do
    alias Petbook.Likes.Like

    @valid_attrs %{likes: 42}
    @update_attrs %{likes: 43}
    @invalid_attrs %{likes: nil}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Likes.create_like()

      like
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert Likes.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert Likes.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = Likes.create_like(@valid_attrs)
      assert like.likes == 42
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Likes.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, %Like{} = like} = Likes.update_like(like, @update_attrs)
      assert like.likes == 43
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = Likes.update_like(like, @invalid_attrs)
      assert like == Likes.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = Likes.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> Likes.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = Likes.change_like(like)
    end
  end
end