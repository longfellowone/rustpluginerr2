use server::app;
use server::config::Configuration;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let config = Configuration::new()?;

    let pool = config.postgres.pool().await;

    app::run(config.app, pool).await?;

    Ok(())
}
