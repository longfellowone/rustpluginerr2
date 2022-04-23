use crate::receptacle_assemblies::ReceptacleAssembly;
use async_graphql::{Context, Object};
use sqlx::PgPool;

pub struct QueryRoot;

#[Object]
impl QueryRoot {
    pub async fn receptacle_assemblies(&self, ctx: &Context<'_>) -> Vec<ReceptacleAssembly> {
        let pool = ctx.data_unchecked::<PgPool>();

        // Mouseover type hint works, but not visual type hint
        let receptacle_assemblies = sqlx::query_as!(
            ReceptacleAssembly,
            // language=PostgreSQL
            r#"
            select * from receptacle_assembly
            "#,
        )
        // You can also delete these 3 lines below and retype, also have no auto completion
        .fetch_all(pool)
        .await
        .unwrap();

        // Trying typing the line below, you lose all auto completion
        // let test = sqlx::

        println!("{:?}", receptacle_assemblies);

        receptacle_assemblies
    }
}
